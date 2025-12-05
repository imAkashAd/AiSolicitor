package com.example.ryanlord

import android.Manifest
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.telecom.TelecomManager
import android.os.Bundle
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
                        // Don't open native dialer, just trigger call in background
                        result.success(null)
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
                else -> result.notImplemented()
            }
        }

        requestPermissions()
    }

    private fun requestPermissions() {
        val permissions = arrayOf(
            Manifest.permission.CALL_PHONE,
            Manifest.permission.READ_PHONE_STATE,
            Manifest.permission.READ_CALL_LOG,
            Manifest.permission.ANSWER_PHONE_CALLS
        )

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