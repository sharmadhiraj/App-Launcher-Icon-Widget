package com.sharmadhiraj.app_launcher_icon_widget

import android.annotation.SuppressLint
import android.content.Context
import android.graphics.Bitmap
import android.graphics.drawable.BitmapDrawable
import android.graphics.drawable.Drawable
import androidx.core.content.ContextCompat
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.io.ByteArrayOutputStream

/** AppLauncherIconWidgetPlugin */
class AppLauncherIconWidgetPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "app_launcher_icon_widget")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "getAppLauncherIcon") {
            result.success(getAppLauncherIcon())
        } else {
            result.notImplemented()
        }
    }

    private fun getAppLauncherIcon(): ByteArray {
        return try {
            var drawable = getDrawable(true)
            if (drawable == null) {
                drawable = getDrawable(false)
            }
            val byteArray = if (drawable == null) ByteArray(0) else drawableToByteArray(drawable)
            byteArray
        } catch (e: Exception) {
            ByteArray(0)
        }
    }

    @SuppressLint("DiscouragedApi")
    private fun getDrawable(mipmap: Boolean): Drawable {
        val id: Int = context.resources.getIdentifier(
            "ic_launcher",
            if (mipmap) "mipmap" else "drawable",
            context.packageName
        )
        return ContextCompat.getDrawable(context, id)
    }

    private fun drawableToByteArray(drawable: Drawable): ByteArray {
        return try {
            val bitmap: Bitmap = (drawable as BitmapDrawable).bitmap
            val stream = ByteArrayOutputStream()
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, stream)
            stream.toByteArray()
        } catch (e: Exception) {
            ByteArray(0)
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
