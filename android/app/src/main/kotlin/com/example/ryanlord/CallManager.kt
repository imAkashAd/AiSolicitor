package com.example.ryanlord

import android.content.Context
import android.media.AudioManager
import android.telecom.Call
import android.telecom.DisconnectCause
import android.telecom.VideoProfile
import io.flutter.plugin.common.MethodChannel

class CallManager(private val context: Context, private val channel: MethodChannel) {

    private var currentCall: Call? = null
    private val audioManager: AudioManager =
        context.getSystemService(Context.AUDIO_SERVICE) as AudioManager

    private val callback: Call.Callback = object : Call.Callback() {

        override fun onStateChanged(call: Call, state: Int) {
            super.onStateChanged(call, state)

            val stateString = when (state) {
                Call.STATE_NEW -> "NEW"
                Call.STATE_RINGING -> "RINGING"
                Call.STATE_DIALING -> "DIALING"
                Call.STATE_ACTIVE -> "ACTIVE"
                Call.STATE_HOLDING -> "HOLDING"
                Call.STATE_DISCONNECTED -> "DISCONNECTED"
                else -> "UNKNOWN"
            }

            val phoneNumber = call.details?.handle?.schemeSpecificPart ?: ""
            val isIncoming = call.details?.callDirection ==
                    Call.Details.DIRECTION_INCOMING

            var disconnectReason: String? = null
            var disconnectMessage: String? = null

            if (state == Call.STATE_DISCONNECTED) {
                val cause = call.details?.disconnectCause
                disconnectReason = getDisconnectReasonString(cause?.code)
                disconnectMessage = cause?.description?.toString()
            }

            channel.invokeMethod("onCallStateChanged", mapOf(
                "state" to stateString,
                "phoneNumber" to phoneNumber,
                "isIncoming" to isIncoming,
                "disconnectReason" to disconnectReason,
                "disconnectMessage" to disconnectMessage
            ))

            if (state == Call.STATE_DISCONNECTED) {
                currentCall?.unregisterCallback(callback)
                currentCall = null
            }
        }


        override fun onDetailsChanged(call: Call, details: Call.Details) {
            super.onDetailsChanged(call, details)

            val phoneNumber = details.handle?.schemeSpecificPart ?: ""
            val callerName = details.callerDisplayName?.toString() ?: ""

            channel.invokeMethod("onCallDetailsChanged", mapOf(
                "phoneNumber" to phoneNumber,
                "callerName" to callerName
            ))
        }
    }


    private fun getDisconnectReasonString(code: Int?): String {
        return when (code) {
            DisconnectCause.BUSY -> "BUSY"
            DisconnectCause.CANCELED -> "CANCELED"
            DisconnectCause.ERROR -> "ERROR"
            DisconnectCause.LOCAL -> "LOCAL"
            DisconnectCause.REMOTE -> "REMOTE"
            DisconnectCause.REJECTED -> "REJECTED"
            DisconnectCause.RESTRICTED -> "RESTRICTED"
            DisconnectCause.MISSED -> "MISSED"
            DisconnectCause.CONNECTION_MANAGER_NOT_SUPPORTED -> "NOT_SUPPORTED"
            DisconnectCause.CALL_PULLED -> "CALL_PULLED"
            DisconnectCause.ANSWERED_ELSEWHERE -> "ANSWERED_ELSEWHERE"
            else -> "UNKNOWN"
        }
    }


    fun setCall(call: Call) {
        currentCall?.unregisterCallback(callback)
        currentCall = call
        currentCall?.registerCallback(callback)

        val stateString = when (call.state) {
            Call.STATE_RINGING -> "RINGING"
            Call.STATE_DIALING -> "DIALING"
            Call.STATE_ACTIVE -> "ACTIVE"
            else -> "NEW"
        }

        val phoneNumber = call.details?.handle?.schemeSpecificPart ?: ""
        val isIncoming = call.details?.callDirection ==
                Call.Details.DIRECTION_INCOMING

        channel.invokeMethod("onCallStateChanged", mapOf(
            "state" to stateString,
            "phoneNumber" to phoneNumber,
            "isIncoming" to isIncoming,
            "disconnectReason" to null,
            "disconnectMessage" to null
        ))
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
