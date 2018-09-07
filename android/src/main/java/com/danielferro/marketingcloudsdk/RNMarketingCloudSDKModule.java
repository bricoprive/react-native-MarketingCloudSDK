
package com.danielferro.marketingcloudsdk;

import android.support.annotation.NonNull;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableArray;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.bridge.WritableNativeMap;

import com.salesforce.marketingcloud.MarketingCloudConfig;
import com.salesforce.marketingcloud.MarketingCloudSdk;
import com.salesforce.marketingcloud.messages.inbox.InboxMessage;
import com.salesforce.marketingcloud.messages.inbox.InboxMessageManager;
import com.salesforce.marketingcloud.messages.push.PushMessageManager;
import com.salesforce.marketingcloud.registration.RegistrationManager;

import java.util.Map;
import java.util.Set;

public class RNMarketingCloudSDKModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNMarketingCloudSDKModule(ReactApplicationContext reactContext) {
    super(reactContext);

    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "MarketingCloudSDK";
  }

  /*
   * Base Methods
   */

  @ReactMethod
  public void setContactKey(final String contactKey, final Promise promise) {
    MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {
      @Override
      public void ready(@NonNull MarketingCloudSdk marketingCloudSdk) {
        RegistrationManager registrationManager = marketingCloudSdk.getRegistrationManager();

        Boolean status = registrationManager
                .edit()
                .setContactKey(contactKey)
                .commit();

        promise.resolve(contactKey);
      }
    });
  }

  @ReactMethod
  public void contactKey(final Promise promise) {
    MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {
      @Override
      public void ready(@NonNull MarketingCloudSdk marketingCloudSdk) {
        RegistrationManager registrationManager = marketingCloudSdk.getRegistrationManager();

        String contactKey = registrationManager.getContactKey();

        promise.resolve(contactKey);
      }
    });
  }

  @ReactMethod
  public void addTag(final String tag, final Promise promise) {
    MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {
      @Override
      public void ready(@NonNull MarketingCloudSdk marketingCloudSdk) {
        RegistrationManager registrationManager = marketingCloudSdk.getRegistrationManager();

        Boolean status = registrationManager
                .edit()
                .addTag(tag)
                .commit();

        promise.resolve(status);
      }
    });
  }

  @ReactMethod
  public void removeTag(final String tag, final Promise promise) {
    MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {
      @Override
      public void ready(@NonNull MarketingCloudSdk marketingCloudSdk) {
        RegistrationManager registrationManager = marketingCloudSdk.getRegistrationManager();

        Boolean status = registrationManager
                .edit()
                .removeTag(tag)
                .commit();

        promise.resolve(status);
      }
    });
  }

  @ReactMethod
  public void addTags(final ReadableArray tags, final Promise promise) {
    MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {
      @Override
      public void ready(@NonNull MarketingCloudSdk marketingCloudSdk) {
        RegistrationManager registrationManager = marketingCloudSdk.getRegistrationManager();
        RegistrationManager.Editor editor = registrationManager.edit();

        for (Object object : tags.toArrayList()) {
          editor.addTag(object.toString());
        }

        Boolean status = editor.commit();

        promise.resolve(status);
      }
    });
  }

  @ReactMethod
  public void removeTags(final ReadableArray tags, final Promise promise) {
    MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {
      @Override
      public void ready(@NonNull MarketingCloudSdk marketingCloudSdk) {
        RegistrationManager registrationManager = marketingCloudSdk.getRegistrationManager();
        RegistrationManager.Editor editor = registrationManager.edit();

        for (Object object : tags.toArrayList()) {
          editor.removeTag(object.toString());
        }

        Boolean status = editor.commit();

        promise.resolve(status);
      }
    });
  }

  @ReactMethod
  public void tags(final Promise promise) {
    MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {
      @Override
      public void ready(@NonNull MarketingCloudSdk marketingCloudSdk) {
        RegistrationManager registrationManager = marketingCloudSdk.getRegistrationManager();

        Set<String> tags = registrationManager.getTags();

        promise.resolve(tags);
      }
    });
  }

  @ReactMethod
  public void setAttribute(final String name, final String value, final Promise promise) {
    MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {
      @Override
      public void ready(@NonNull MarketingCloudSdk marketingCloudSdk) {
        RegistrationManager registrationManager = marketingCloudSdk.getRegistrationManager();

        Boolean status = registrationManager
                .edit()
                .setAttribute(name, value)
                .commit();

        promise.resolve(status);
      }
    });
  }

  @ReactMethod
  public void clearAttribute(final String name, final Promise promise) {
    MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {
      @Override
      public void ready(@NonNull MarketingCloudSdk marketingCloudSdk) {
        RegistrationManager registrationManager = marketingCloudSdk.getRegistrationManager();

        Boolean status = registrationManager
                .edit()
                .clearAttribute(name)
                .commit();

        promise.resolve(status);
      }
    });
  }

  @ReactMethod
  public void attributes(final Promise promise) {
    MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {
      @Override
      public void ready(@NonNull MarketingCloudSdk marketingCloudSdk) {
        RegistrationManager registrationManager = marketingCloudSdk.getRegistrationManager();

        Map<String, String> attributes = registrationManager.getAttributesMap();

        promise.resolve(attributes);
      }
    });
  }

  @ReactMethod
  public void setAttributes(final ReadableMap attributes, final Promise promise) {
    MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {
      @Override
      public void ready(@NonNull MarketingCloudSdk marketingCloudSdk) {
        RegistrationManager registrationManager = marketingCloudSdk.getRegistrationManager();

        RegistrationManager.Editor editor = registrationManager.edit();


        for (Map.Entry<String, Object> entry : attributes.toHashMap().entrySet()) {
          String key = entry.getKey();
          String value = entry.getValue().toString();

          editor.setAttribute(key, value);
        }

        Boolean status = editor.commit();

        promise.resolve(status);
      }
    });
  }

  @ReactMethod
  public void clearAttributes(final ReadableArray attributes, final Promise promise) {
    MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {
      @Override
      public void ready(@NonNull MarketingCloudSdk marketingCloudSdk) {
        RegistrationManager registrationManager = marketingCloudSdk.getRegistrationManager();
        RegistrationManager.Editor editor = registrationManager.edit();

        for (Object object : attributes.toArrayList()) {
          editor.removeTag(object.toString());
        }

        Boolean status = editor.commit();

        promise.resolve(status);
      }
    });
  }

  @ReactMethod
  public void deviceToken(final Promise promise) {
    MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {
      @Override
      public void ready(@NonNull MarketingCloudSdk marketingCloudSdk) {
        RegistrationManager registrationManager = marketingCloudSdk.getRegistrationManager();

        String deviceToken = registrationManager.getSystemToken();

        promise.resolve(deviceToken);
      }
    });
  }

  @ReactMethod
  public void appID(final Promise promise) {
    MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {
      @Override
      public void ready(@NonNull MarketingCloudSdk marketingCloudSdk) {
        MarketingCloudConfig config = marketingCloudSdk.getMarketingCloudConfig();

        String appID = config.applicationId();

        promise.resolve(appID);
      }
    });
  }

  @ReactMethod
  public void accessToken(final Promise promise) {
    MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {
      @Override
      public void ready(@NonNull MarketingCloudSdk marketingCloudSdk) {
        MarketingCloudConfig config = marketingCloudSdk.getMarketingCloudConfig();

        String accessToken = config.accessToken();

        promise.resolve(accessToken);
      }
    });
  }

  @ReactMethod
  public void deviceIdentifier(final Promise promise) {
    MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {
      @Override
      public void ready(@NonNull MarketingCloudSdk marketingCloudSdk) {
        RegistrationManager registrationManager = marketingCloudSdk.getRegistrationManager();

        String deviceIdentifier = registrationManager.getDeviceId();

        promise.resolve(deviceIdentifier);
      }
    });
  }

  @ReactMethod
  public void setPushEnabled(final Boolean enabled, final Promise promise) {
    MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {
      @Override
      public void ready(@NonNull MarketingCloudSdk marketingCloudSdk) {
        PushMessageManager pushMessageManager = marketingCloudSdk.getPushMessageManager();

        if (enabled) {
          pushMessageManager.enablePush();
        } else {
          pushMessageManager.disablePush();
        }

        promise.resolve(true);
      }
    });
  }

  @ReactMethod
  public void pushEnabled(final Boolean enabled, final Promise promise) {
    MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {
      @Override
      public void ready(@NonNull MarketingCloudSdk marketingCloudSdk) {
        PushMessageManager pushMessageManager = marketingCloudSdk.getPushMessageManager();

        Boolean status = pushMessageManager.isPushEnabled();

        promise.resolve(status);
      }
    });
  }

  /**
   * Inbox Messages Methods
   */

  @ReactMethod
  public void getAllMessages(final Promise promise) {
    MarketingCloudSdk.requestSdk(new MarketingCloudSdk.WhenReadyListener() {
      @Override
      public void ready(@NonNull MarketingCloudSdk marketingCloudSdk) {
        InboxMessageManager inboxMessageManager = marketingCloudSdk.getInboxMessageManager();

        WritableArray messageArray = Arguments.createArray();
        for (InboxMessage message : inboxMessageManager.getMessages()) {
          WritableMap messageMap = new WritableNativeMap();
          messageMap.putString("alert", message.alert());
          messageMap.putInt("contentType", message.contentType());
          messageMap.putString("custom", message.custom());
          messageMap.putBoolean("deleted", message.deleted());
          messageMap.putString("endDateUtc", message.endDateUtc().toString());
          messageMap.putString("id", message.id());
          messageMap.putString("messageHash", message.messageHash());
          messageMap.putInt("messageType", message.messageType());
          messageMap.putBoolean("read", message.read());
          messageMap.putString("requestId", message.requestId());
          messageMap.putString("sound", message.sound());
          messageMap.putString("startDateUtc", message.startDateUtc().toString());
          messageMap.putString("subject", message.subject());
          messageMap.putString("title", message.title());
          messageMap.putString("url", message.url());

          messageArray.pushMap(messageMap);
        }

        promise.resolve(messageArray);
      }
    });
  }
}
