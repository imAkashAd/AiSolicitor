package com.example.ryanlord

import android.Manifest
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.telecom.PhoneAccountHandle
import android.telecom.TelecomManager
import android.app.AlertDialog
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val CHANNEL = "com.example.ryanlord/calls"
    private val PERMISSION_REQUEST_CODE = 123
    private lateinit var callManager: CallManager

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)

        callManager = CallManager(this, channel)
        CallService.methodChannel = channel
        CallService.callManager = callManager

        channel.setMethodCallHandler { call, result ->
            when (call.method) {
                "setDefaultDialer" -> {
                    setAsDefaultDialer()
                    result.success(true)
                }

                "makeCall" -> {
                    val phoneNumber = call.argument<String>("phoneNumber")
                    if (phoneNumber != null) {
                        selectSimAndMakeCall(phoneNumber, result)
                    } else {
                        result.error("INVALID_ARGUMENT", "Phone number required", null)
                    }
                }

                "answerCall" -> {
                    callManager.answerCall()
                    result.success(null)
                }

                "endCall" -> {
                    callManager.endCall()
                    result.success(null)
                }

                "toggleSpeaker" -> {
                    callManager.toggleSpeaker(call.argument<Boolean>("enable") ?: false)
                    result.success(null)
                }

                "toggleMute" -> {
                    callManager.toggleMute(call.argument<Boolean>("mute") ?: false)
                    result.success(null)
                }

                "checkPermissions" -> {
                    result.success(checkCallPermissions())
                }

                "requestPermissions" -> {
                    requestPermissions()
                    result.success(null)
                }

                else -> result.notImplemented()
            }
        }
    }


    // ------------------- SIM SELECTION -------------------

    private fun selectSimAndMakeCall(phoneNumber: String, result: MethodChannel.Result) {

        if (!checkCallPermissions()) {
            result.error("PERMISSION_DENIED", "Missing call permissions", null)
            return
        }

        val telecomManager = getSystemService(TELECOM_SERVICE) as TelecomManager
        val accounts = telecomManager.callCapablePhoneAccounts

        when {
            accounts.isEmpty() -> {
                result.error("NO_SIM", "No SIM card detected", null)
            }

            accounts.size == 1 -> {
                makeCallWithAccount(phoneNumber, accounts[0])
                result.success(null)
            }

            else -> showSimSelectionDialog(phoneNumber, accounts, result)
        }
    }


    private fun showSimSelectionDialog(
        phoneNumber: String,
        accounts: List<PhoneAccountHandle>,
        result: MethodChannel.Result
    ) {

        val telecomManager = getSystemService(TELECOM_SERVICE) as TelecomManager

        val simNames = accounts.mapIndexed { index, handle ->
            val acc = telecomManager.getPhoneAccount(handle)
            acc?.label?.toString() ?: "SIM ${index + 1}"
        }.toTypedArray()

        runOnUiThread {

            AlertDialog.Builder(this)
                .setTitle("Select SIM Card")
                .setItems(simNames) { dialog, which ->

                    makeCallWithAccount(phoneNumber, accounts[which])
                    result.success(null)

                    dialog?.dismiss()
                }
                .setOnCancelListener {
                    result.error("CANCELLED", "User cancelled SIM selection", null)
                }
                .show()
        }
    }


    // ------------------- MAKE CALL -------------------

    private fun makeCallWithAccount(phoneNumber: String, account: PhoneAccountHandle) {

        val uri = Uri.fromParts("tel", phoneNumber, null)

        val bundle = Bundle().apply {
            putParcelable(TelecomManager.EXTRA_PHONE_ACCOUNT_HANDLE, account)
        }

        val telecomManager = getSystemService(TELECOM_SERVICE) as TelecomManager

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            telecomManager.placeCall(uri, bundle)
        } else {
            val intent = Intent(Intent.ACTION_CALL, uri).apply {
                putExtras(bundle)
            }
            startActivity(intent)
        }
    }


    // ------------------- PERMISSIONS -------------------

    private fun checkCallPermissions(): Boolean {
        val permissions = arrayOf(
            Manifest.permission.CALL_PHONE,
            Manifest.permission.READ_PHONE_STATE,
            Manifest.permission.READ_CALL_LOG
        )

        return permissions.all {
            ContextCompat.checkSelfPermission(this, it) ==
                    PackageManager.PERMISSION_GRANTED
        }
    }


    private fun requestPermissions() {

        val permissions = mutableListOf(
            Manifest.permission.CALL_PHONE,
            Manifest.permission.READ_PHONE_STATE,
            Manifest.permission.READ_CALL_LOG
        )

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            permissions.add(Manifest.permission.ANSWER_PHONE_CALLS)
        }

        val toRequest = permissions.filter {
            ContextCompat.checkSelfPermission(this, it) !=
                    PackageManager.PERMISSION_GRANTED
        }

        if (toRequest.isNotEmpty()) {
            ActivityCompat.requestPermissions(
                this,
                toRequest.toTypedArray(),
                PERMISSION_REQUEST_CODE
            )
        }
    }
    private fun setAsDefaultDialer() {
        val telecomManager = getSystemService(TELECOM_SERVICE) as TelecomManager
        val intent = Intent(TelecomManager.ACTION_CHANGE_DEFAULT_DIALER).apply {
            putExtra(
                TelecomManager.EXTRA_CHANGE_DEFAULT_DIALER_PACKAGE_NAME,
                packageName
            )
        }
        startActivity(intent)
    }
}
