package com.example.ryanlord

import android.content.Context
import android.media.AudioManager
import android.telecom.Call
import android.telecom.VideoProfile
import io.flutter.plugin.common.MethodChannel

class CallManager(private val context: Context, private val channel: MethodChannel) {
    private var currentCall: Call? = null
    private val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager

    private val callback = object : Call.Callback() {
        override fun onStateChanged(call: Call, state: Int) {
            super.onStateChanged(call, state)
            val stateString = when (state) {
                Call.STATE_NEW -> "NEW"
                Call.STATE_RINGING -> "RINGING"
                Call.STATE_DIALING -> "DIALING"
                Call.STATE_ACTIVE -> "OFFHOOK"
                Call.STATE_HOLDING -> "HOLDING"
                Call.STATE_DISCONNECTED -> "IDLE"
                else -> "UNKNOWN"
            }
            
            val phoneNumber = call.details?.handle?.schemeSpecificPart ?: ""
            channel.invokeMethod("onCallStateChanged", mapOf(
                "state" to stateString,
                "phoneNumber" to phoneNumber
            ))

            if (state == Call.STATE_DISCONNECTED) {
                currentCall = null
            }
        }
    }

    fun setCall(call: Call) {
        currentCall?.unregisterCallback(callback)
        currentCall = call
        currentCall?.registerCallback(callback)
    }

    fun answerCall() {
        currentCall?.answer(VideoProfile.STATE_AUDIO_ONLY)
    }

    fun endCall() {
        currentCall?.disconnect()
        currentCall = null
    }

    fun toggleSpeaker(enable: Boolean) {
        audioManager.isSpeakerphoneOn = enable
    }

    fun toggleMute(mute: Boolean) {
        audioManager.isMicrophoneMute = mute
    }
}