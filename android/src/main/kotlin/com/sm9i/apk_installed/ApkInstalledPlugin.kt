package com.sm9i.apk_installed

import android.content.Context
import android.content.pm.PackageManager
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.lang.Exception

/** ApkInstalledPlugin */
class ApkInstalledPlugin : FlutterPlugin, MethodCallHandler {

    private var mApplicationContext: Context? = null
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        mApplicationContext = flutterPluginBinding.applicationContext
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "apk_installed")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "getPackageIsInstalled") {
            val packageName: String? = call.argument<String>("package_name")
            try {
                if (packageName != null) {

                    val applicationInfo = mApplicationContext?.packageManager?.getPackageInfo(packageName, PackageManager.MATCH_UNINSTALLED_PACKAGES)

                    if (applicationInfo != null) {
                        result.success(true)
                    } else {
                        result.success(false)
                    }
                } else {
                    result.success(false)
                }
            } catch (e: Exception) {
                result.success(false)
            }
        } else {
            result.notImplemented()
        }

    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {

        channel.setMethodCallHandler(null)
    }
}
