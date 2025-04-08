package com.littlefox.app.foxschool.foxschool

import android.util.Log
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel // 이 줄을 추가하세요

class MainActivity: FlutterActivity() {


    private val CHANNEL = "com.littlefox.app.foxschool/log"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine)
    {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            when (call.method)
            {
                "initialize" ->
                {
                    // 로거 초기화 (필요한 경우)
                    result.success(null)
                }

                "log" ->
                {
                    val tag = call.argument<String>("tag") ?: "Flutter"
                    val level = call.argument<String>("level") ?: "INFO"
                    val message = call.argument<String>("message") ?: ""

                    // 로그 레벨에 따라 다른 로깅 메서드 호출
                    when (level)
                    {
                        "INFO" -> Log.i(tag, message)
                        "WARN" -> Log.w(tag, message)
                        "ERROR" -> Log.e(tag, message)
                        else -> Log.d(tag, message)
                    }

                    result.success(null)
                }

                else ->
                {
                    result.notImplemented()
                }
            }
        }
    }
}
