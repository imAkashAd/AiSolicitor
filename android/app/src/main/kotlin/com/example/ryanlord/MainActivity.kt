package com.example.ryanlord

import android.Manifest
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.telecom.PhoneAccountHandle
import android.telecom.TelecomManager
import android.os.Bundle
import android.os.Build
import androidx.appcompat.app.AlertDialog
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
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
                "makeCall" -> {
                    val phoneNumber = call.argument<String>("phoneNumber")
                    if (phoneNumber != null) {
                        selectSimAndMakeCall(phoneNumber, result)
                    } else {
                        result.error("INVALID_ARGUMENT", "Phone number is required", null)
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
                    val enable = call.argument<Boolean>("enable") ?: false
                    callManager.toggleSpeaker(enable)
                    result.success(null)
                }
                "toggleMute" -> {
                    val mute = call.argument<Boolean>("mute") ?: false
                    callManager.toggleMute(mute)
                    result.success(null)
                }
                "checkPermissions" -> {
                    val hasPermissions = checkCallPermissions()
                    result.success(hasPermissions)
                }
                "requestPermissions" -> {
                    requestPermissions()
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun selectSimAndMakeCall(phoneNumber: String, result: MethodChannel.Result) {
        if (!checkCallPermissions()) {
            result.error("PERMISSION_DENIED", "Call permissions not granted", null)
            return
        }

        val telecomManager = getSystemService(TELECOM_SERVICE) as TelecomManager
        val phoneAccounts = telecomManager.callCapablePhoneAccounts

        when {
            phoneAccounts.isEmpty() -> {
                result.error("NO_SIM", "No SIM card available", null)
            }
            phoneAccounts.size == 1 -> {
                makeCallWithAccount(phoneNumber, phoneAccounts[0])
                result.success(null)
            }
            else -> {
                showSimSelectionDialog(phoneNumber, phoneAccounts, result)
            }
        }
    }

    private fun showSimSelectionDialog(
        phoneNumber: String,
        accounts: List<PhoneAccountHandle>,
        result: MethodChannel.Result
    ) {
        val telecomManager = getSystemService(TELECOM_SERVICE) as TelecomManager
        val simNames = accounts.map { handle =>
            val account = telecomManager.getPhoneAccount(handle)
            account?.label?.toString() ?: "SIM ${accounts.indexOf(handle) + 1}"
        }.toTypedArray()

        runOnUiThread {
            AlertDialog.Builder(this)
                .setTitle("Select SIM Card")
                .setItems(simNames) { dialog, which ->
                    makeCallWithAccount(phoneNumber, accounts[which])
                    result.success(null)
                    dialog.dismiss()
                }
                .setOnCancelListener {
                    result.error("CANCELLED", "SIM selection cancelled", null)
                }
                .show()
        }
    }

    private fun makeCallWithAccount(phoneNumber: String, accountHandle: PhoneAccountHandle) {
        val uri = Uri.fromParts("tel", phoneNumber, null)
        val extras = Bundle().apply {
            putParcelable(TelecomManager.EXTRA_PHONE_ACCOUNT_HANDLE, accountHandle)
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            val telecomManager = getSystemService(TELECOM_SERVICE) as TelecomManager
            telecomManager.placeCall(uri, extras)
        } else {
            val intent = Intent(Intent.ACTION_CALL, uri).apply {
                putExtras(extras)
            }
            startActivity(intent)
        }
    }

    private fun checkCallPermissions(): Boolean {
        val permissions = arrayOf(
            Manifest.permission.CALL_PHONE,
            Manifest.permission.READ_PHONE_STATE,
            Manifest.permission.READ_CALL_LOG
        )

        return permissions.all {
            ContextCompat.checkSelfPermission(this, it) == PackageManager.PERMISSION_GRANTED
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

        val permissionsToRequest = permissions.filter {
            ContextCompat.checkSelfPermission(this, it) != PackageManager.PERMISSION_GRANTED
        }

        if (permissionsToRequest.isNotEmpty()) {
            ActivityCompat.requestPermissions(
                this,
                permissionsToRequest.toTypedArray(),
                PERMISSION_REQUEST_CODE
            )
        }
    }
}