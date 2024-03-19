package br.eti.inovareti.floting_button;

import android.widget.ImageView;

import androidx.annotation.NonNull;

import com.yhao.floatwindow.FloatWindow;
import com.yhao.floatwindow.Screen;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "floating_button";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler((call, result) -> {
            switch (call.method) {
                case "create":
                    ImageView imageView = new ImageView(getApplicationContext());
                    imageView.setImageResource(R.drawable.plus);
                    FloatWindow.with(getApplicationContext())
                            .setView(imageView)
                            .setWidth(Screen.width, 0.15f)
                            .setHeight(Screen.height, 0.15f)
                            .setX(Screen.width, 0.8f)
                            .setY(Screen.height, 0.3f)
                            .setDesktopShow(true)
                            .build();
                    break;
                case "show":
                    FloatWindow.get().show();
                    break;
                case "hide":
                    FloatWindow.get().hide();
                    break;
            }
        });
    }
}
