
#import "RNMarketingCloudSDK.h"
#import <MarketingCloudSDK/MarketingCloudSDK.h>

@implementation RNMarketingCloudSDK

- (dispatch_queue_t)methodQueue {
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE();

+ (NSMutableArray *)formatMessages:(NSArray *)inboxMessages {
  NSTimeZone *timeZone = [NSTimeZone defaultTimeZone];
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setTimeZone:timeZone];
  [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];

  NSMutableArray *messages = [NSMutableArray array];
  for (NSMutableDictionary *message in inboxMessages) {
    [message setObject:[dateFormatter stringFromDate:[message valueForKey: @"startDateUtc"]] forKey:@"startDateUtc"];
    [message setObject:[dateFormatter stringFromDate:[message valueForKey: @"endDateUtc"]] forKey:@"endDateUtc"];
    [messages addObject:message];
  }

  return messages;
}

#pragma mark -
#pragma mark Base Methods

RCT_REMAP_METHOD(configure,
                 configure_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  NSError *error = nil;
  BOOL status = [[MarketingCloudSDK sharedInstance] sfmc_configure:&error];

  resolve(@(status));
}

RCT_REMAP_METHOD(configure,
                 URL:(NSURL *)url
                 configurationIndex:(NSNumber *) configurationIndex
                 configureWithURL_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  NSError *error = nil;
  BOOL status = [[MarketingCloudSDK sharedInstance] sfmc_configureWithURL:url configurationIndex:configurationIndex error:&error];

  resolve(@(status));
}

RCT_REMAP_METHOD(configure,
                 callback:(RCTResponseSenderBlock) callback) {
  NSError *error = nil;
  [[MarketingCloudSDK sharedInstance] sfmc_configure:&error
                                   completionHandler:^(BOOL configured, NSString * _Nonnull appId, NSError * _Nullable error) {
                                     callback(@[[error localizedDescription], @(configured), appId]);
                                   }];
}


RCT_REMAP_METHOD(configure,
                 URL:(NSURL *)url
                 configurationIndex:(NSNumber *) configurationIndex
                 callback:(RCTResponseSenderBlock) callback) {
  NSError *error = nil;
  [[MarketingCloudSDK sharedInstance] sfmc_configureWithURL:url
                                                       configurationIndex:configurationIndex
                                                                    error:&error
                                                        completionHandler:^(BOOL configured, NSString * _Nonnull appId, NSError * _Nullable error) {
                                                          callback(@[[error localizedDescription], @(configured), appId]);
  }];
}

RCT_EXPORT_METHOD(tearDown) {
  [[MarketingCloudSDK sharedInstance] sfmc_tearDown];
}

RCT_REMAP_METHOD(setContactKey,
                 contactKey:(NSString * _Nonnull)contactKey
                 setContactKey_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  BOOL status = [[MarketingCloudSDK sharedInstance] sfmc_setContactKey:contactKey];

  resolve(@(status));
}

RCT_REMAP_METHOD(contactKey,
                 contactKey_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  NSString *contactKey = [[MarketingCloudSDK sharedInstance] sfmc_contactKey];

  resolve(contactKey);
}

RCT_REMAP_METHOD(addTag,
                 tag:(NSString * _Nonnull)tag
                 addTag_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  BOOL status = [[MarketingCloudSDK sharedInstance] sfmc_addTag:tag];

  resolve(@(status));
}

RCT_REMAP_METHOD(removeTag,
                 tag:(NSString * _Nonnull)tag
                 removeTag_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  BOOL status = [[MarketingCloudSDK sharedInstance] sfmc_removeTag:tag];

  resolve(@(status));
}

RCT_REMAP_METHOD(addTags,
                 tags:(NSArray * _Nonnull)tags
                 addTags_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  NSSet *tagsAdded = [[MarketingCloudSDK sharedInstance] sfmc_addTags:tags];

  resolve(tagsAdded);
}

RCT_REMAP_METHOD(removeTags,
                 tags:(NSArray * _Nonnull)tags
                 removeTags:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  NSSet *tagsRemoved = [[MarketingCloudSDK sharedInstance] sfmc_removeTags:tags];

  resolve(tagsRemoved);
}

RCT_REMAP_METHOD(tags,
                 tags_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  NSSet *tags = [[MarketingCloudSDK sharedInstance] sfmc_tags];

  resolve(tags);
}

RCT_REMAP_METHOD(setAttribute,
                 named:(NSString * _Nonnull)name
                 value:(NSString * _Nonnull)value
                 setAttribute_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  BOOL status = [[MarketingCloudSDK sharedInstance] sfmc_setAttributeNamed:name value:value];

  resolve(@(status));
}

RCT_REMAP_METHOD(clearAttribute,
                 named:(NSString * _Nonnull)name
                 clearAttribute_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  BOOL status = [[MarketingCloudSDK sharedInstance] sfmc_clearAttributeNamed:name];

  resolve(@(status));
}

RCT_REMAP_METHOD(attributes,
                 attributes_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  NSDictionary *attributes = [[MarketingCloudSDK sharedInstance] sfmc_attributes];

  resolve(attributes);
}

RCT_REMAP_METHOD(setAttributes,
                 attributes:(NSArray * _Nonnull)attributes
                 setAttributes_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  NSDictionary *addedAttributes = [[MarketingCloudSDK sharedInstance] sfmc_setAttributes:attributes];

  resolve(addedAttributes);
}

RCT_REMAP_METHOD(clearAttributes,
                 attributes:(NSArray * _Nonnull)attributes
                 clearAttributes_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  NSDictionary *clearedAttributes = [[MarketingCloudSDK sharedInstance] sfmc_clearAttributesNamed:attributes];

  resolve(clearedAttributes);
}

RCT_REMAP_METHOD(deviceToken,
                 deviceToken_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  NSString *deviceToken = [[MarketingCloudSDK sharedInstance] sfmc_deviceToken];

  resolve(deviceToken);
}

RCT_REMAP_METHOD(appID,
                 appID_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  NSString *appID = [[MarketingCloudSDK sharedInstance] sfmc_appID];

  resolve(appID);
}

RCT_REMAP_METHOD(accessToken,
                 accessToken_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  NSString *accessToken = [[MarketingCloudSDK sharedInstance] sfmc_accessToken];

  resolve(accessToken);
}

RCT_REMAP_METHOD(deviceIdentifier,
                 deviceIdentifier_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  NSString *deviceIdentifier = [[MarketingCloudSDK sharedInstance] sfmc_deviceIdentifier];

  resolve(deviceIdentifier);
}

RCT_EXPORT_METHOD(setPushEnabled:(BOOL)enabled) {
  [[MarketingCloudSDK sharedInstance] sfmc_setPushEnabled:enabled];
}

RCT_REMAP_METHOD(pushEnabled,
                 pushEnabled_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  BOOL status = [[MarketingCloudSDK sharedInstance] sfmc_pushEnabled];

  resolve(@(status));
}

#pragma mark -
#pragma mark InboxMessages Methods

RCT_REMAP_METHOD(getAllMessages,
                 getAllMessages_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  NSMutableArray *messages = [RNMarketingCloudSDK formatMessages:[[MarketingCloudSDK sharedInstance] sfmc_getAllMessages]];

  resolve(messages);
}

RCT_REMAP_METHOD(getUnreadMessages,
                 getUnreadMessages_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  NSMutableArray *messages = [RNMarketingCloudSDK formatMessages:[[MarketingCloudSDK sharedInstance] sfmc_getUnreadMessages]];

  resolve(messages);
}

RCT_REMAP_METHOD(getReadMessages,
                 getReadMessages_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  NSMutableArray *messages = [RNMarketingCloudSDK formatMessages:[[MarketingCloudSDK sharedInstance] sfmc_getReadMessages]];

  resolve(messages);
}

RCT_REMAP_METHOD(getDeletedMessages,
                 getDeletedMessages_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  NSMutableArray *messages = [RNMarketingCloudSDK formatMessages:[[MarketingCloudSDK sharedInstance] sfmc_getDeletedMessages]];

  resolve(messages);
}

RCT_REMAP_METHOD(getAllMessagesCount,
                 getAllMessagesCount_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  resolve(@([[MarketingCloudSDK sharedInstance] sfmc_getAllMessagesCount]));
}

RCT_REMAP_METHOD(getUnreadMessagesCount,
                 getUnreadMessagesCount_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  resolve(@([[MarketingCloudSDK sharedInstance] sfmc_getUnreadMessagesCount]));
}

RCT_REMAP_METHOD(getDeletedMessagesCount,
                 getDeletedMessagesCount_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  resolve(@([[MarketingCloudSDK sharedInstance] sfmc_getDeletedMessagesCount]));
}

RCT_EXPORT_METHOD(markMessageRead:(NSDictionary *)message
                  markMessageRead_resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
  BOOL status = [[MarketingCloudSDK sharedInstance] sfmc_markMessageRead:message];

  resolve(@(status));
}

RCT_EXPORT_METHOD(markMessageDeleted:(NSDictionary *)message
                  markMessageDeleted_resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
  BOOL status = [[MarketingCloudSDK sharedInstance] sfmc_markMessageDeleted:message];

  resolve(@(status));
}

RCT_REMAP_METHOD(markAllMessagesRead,
                  markAllMessagesRead_resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
  BOOL status = [[MarketingCloudSDK sharedInstance] sfmc_markAllMessagesRead];

  resolve(@(status));
}

RCT_REMAP_METHOD(markAllMessagesDeleted,
                 markAllMessagesDeleted_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  BOOL status = [[MarketingCloudSDK sharedInstance] sfmc_markAllMessagesDeleted];

  resolve(@(status));
}

RCT_REMAP_METHOD(refreshMessages,
                 refreshMessages_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  BOOL status = [[MarketingCloudSDK sharedInstance] sfmc_refreshMessages];

  resolve(@(status));
}

#pragma mark -
#pragma mark Intellligence

RCT_EXPORT_METHOD(trackMessageOpened:(NSDictionary *_Nonnull) inboxMessage) {
  [[MarketingCloudSDK sharedInstance] sfmc_trackMessageOpened:inboxMessage];
}

RCT_EXPORT_METHOD(trackPageView:(NSString * _Nonnull)url
                  title:(NSString * _Nonnull)title
                  item:(NSString * _Nonnull)item
                  search:(NSString * _Nullable)search) {
  [[MarketingCloudSDK sharedInstance] sfmc_trackPageViewWithURL:url title:title item:item search:search];
}

RCT_EXPORT_METHOD(trackCartContents:(NSDictionary * _Nonnull) cartDictionary) {
  [[MarketingCloudSDK sharedInstance] sfmc_trackCartContents:cartDictionary];
}

RCT_EXPORT_METHOD(trackCartConversion:(NSDictionary * _Nonnull) orderDictionary) {
  [[MarketingCloudSDK sharedInstance] sfmc_trackCartConversion:orderDictionary];
}

RCT_REMAP_METHOD(buildCartItem,
                 price:(NSNumber *_Nonnull)price
                 quantity:(NSNumber *_Nonnull)quantity
                 item:(NSString *_Nonnull)item
                 uniqueId:(NSString *_Nullable) uniqueId
                 cartItemDictionaryWithPrice_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  NSDictionary *cartItem = [[MarketingCloudSDK sharedInstance] sfmc_cartItemDictionaryWithPrice:price quantity:quantity item:item uniqueId:uniqueId];

  resolve(cartItem);
}

RCT_REMAP_METHOD(buildCart,
                 array:(NSArray *_Nonnull) cartItems
                 cartDictionaryWithCartItemDictionaryArray_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  NSDictionary *cart = [[MarketingCloudSDK sharedInstance] sfmc_cartDictionaryWithCartItemDictionaryArray:cartItems];

  resolve(cart);
}

RCT_REMAP_METHOD(buildOrder,
                 ordernumber:(NSString *_Nonnull) orderNumber
                 shipping:(NSNumber *_Nonnull) shipping
                 discount:(NSNumber *_Nonnull) discount
                 cart:(NSDictionary *_Nonnull) cart
                 orderDictionaryWithOrderNumber_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  NSDictionary *order = [[MarketingCloudSDK sharedInstance] sfmc_orderDictionaryWithOrderNumber:orderNumber shipping:shipping discount:discount cart:cart];

  resolve(order);
}

#pragma mark -
#pragma mark Location

RCT_REMAP_METHOD(locationEnabled,
                 locationEnabled_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  BOOL status = [[MarketingCloudSDK sharedInstance] sfmc_locationEnabled];

  resolve(@(status));
}

RCT_EXPORT_METHOD(startWatchingLocation) {
  [[MarketingCloudSDK sharedInstance] sfmc_startWatchingLocation];
}

RCT_EXPORT_METHOD(stopWatchingLocation) {
  [[MarketingCloudSDK sharedInstance] sfmc_stopWatchingLocation];
}

RCT_REMAP_METHOD(watchingLocation,
                 watchingLocation_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  BOOL status = [[MarketingCloudSDK sharedInstance] sfmc_watchingLocation];

  resolve(@(status));
}

RCT_REMAP_METHOD(lastKnownLocation,
                 lastKnownLocation_resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
  NSDictionary *lastKnownLocation = [[MarketingCloudSDK sharedInstance] sfmc_lastKnownLocation];

  resolve(lastKnownLocation);
}

@end
