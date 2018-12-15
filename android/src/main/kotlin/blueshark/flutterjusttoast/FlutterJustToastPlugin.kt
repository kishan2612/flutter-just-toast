package blueshark.flutterjusttoast

import android.content.Context
import android.widget.Toast
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class FlutterJustToastPlugin(context: Context) : MethodCallHandler {

    private var mContext: Context;

    init {
        this.mContext = context
    }

    companion object {

        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "flutter_just_toast")
            channel.setMethodCallHandler(FlutterJustToastPlugin(registrar.activeContext()))
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {

        if (call.method == "toast") {
            val message: String? = call.argument("message")

            val duration: String? = call.argument("duration")

            if (duration == "short") {
                Toast.makeText(mContext, message, Toast.LENGTH_SHORT).show()
            } else {
                Toast.makeText(mContext, message, Toast.LENGTH_LONG).show()
            }
            result.success("done")
        }else {
            result.notImplemented()
        }
    }

}
