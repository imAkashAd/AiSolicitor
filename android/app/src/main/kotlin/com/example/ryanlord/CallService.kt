package com.example.ryanlord

import android.telecom.Call
import android.telecom.InCallService
import io.flutter.plugin.common.MethodChannel

class CallService : InCallService() {
    companion object {
        var callManager: CallManager? = null
        var methodChannel: MethodChannel? = null
    }

    override fun onCallAdded(call: Call) {
        super.onCallAdded(call)
        
        callManager?.setCall(call)
        
        val phoneNumber = call.details?.handle?.schemeSpecificPart ?: "Unknown"
        val callerName = call.details?.callerDisplayName ?: "Unknown Caller"
        
        methodChannel?.invokeMethod("onIncomingCall", mapOf(
            "phoneNumber" to phoneNumber,
            "callerName" to callerName
        ))
    }

    override fun onCallRemoved(call: Call) {
        super.onCallRemoved(call)
        callManager?.endCall()
    }
}