
import { NativeModules } from 'react-native';

const { RNMarketingCloudSDK } = NativeModules;


class MarketingCloudSDK {
  /**
   * Base Methods
   */

  static configure() {
    return RNMarketingCloudSDK.configure();
  }

  static tearDown() {
    return RNMarketingCloudSDK.tearDown();
  }

  static setContactkey(contactKey) {
    return RNMarketingCloudSDK.setContactkey(contactKey);
  }

  static contactKey() {
    return RNMarketingCloudSDK.contactKey();
  }

  static addTag(tag) {
    return RNMarketingCloudSDK.addTag(tag);
  }

  static removeTag(tag) {
    return RNMarketingCloudSDK.removeTag(tag);
  }

  static addTags(tags) {
    return RNMarketingCloudSDK.addTags(tags);
  }

  static removeTags(tags) {
    return RNMarketingCloudSDK.removeTags(tags);
  }

  static tags() {
    return RNMarketingCloudSDK.tags();
  }

  static setAttribute(name, value) {
    return RNMarketingCloudSDK.setAttribute(name, value);
  }

  static clearAttribute(name) {
    return RNMarketingCloudSDK.clearAttribute(name);
  }

  static attributes() {
    return RNMarketingCloudSDK.attributes();
  }

  static setAttributes(attributes) {
    return RNMarketingCloudSDK.setAttributes(attributes);
  }

  static clearAttributes(attributes) {
    return RNMarketingCloudSDK.clearAttributes(attributes);
  }

  static deviceToken() {
    return RNMarketingCloudSDK.deviceToken();
  }

  static appID() {
    return RNMarketingCloudSDK.appID();
  }

  static accessToken() {
    return RNMarketingCloudSDK.accessToken();
  }

  static deviceIdentifier() {
    return RNMarketingCloudSDK.deviceIdentifier();
  }

  static setPushEnabled(enabled) {
    return RNMarketingCloudSDK.setPushEnabled(enabled);
  }

  static pushEnabled() {
    return RNMarketingCloudSDK.pushEnabled();
  }

  /**
   * InboxMessages Methods
   */

  static getAllMessages() {
    return RNMarketingCloudSDK.getAllMessages();
  }

  static getUnreadMessages() {
    return RNMarketingCloudSDK.getUnreadMessages();
  }

  static getReadMessages() {
    return RNMarketingCloudSDK.getReadMessages();
  }

  static getDeletedMessages() {
    return RNMarketingCloudSDK.getDeletedMessages();
  }

  static getAllMessagesCount() {
    return RNMarketingCloudSDK.getAllMessagesCount();
  }

  static getUnreadMessagesCount() {
    return RNMarketingCloudSDK.getUnreadMessagesCount();
  }

  static getDeletedMessagesCount() {
    return RNMarketingCloudSDK.getDeletedMessagesCount();
  }

  static markMessageRead(message) {
    return RNMarketingCloudSDK.markMessageRead(message);
  }

  static markMessageDeleted(message) {
    return RNMarketingCloudSDK.markMessageDeleted(message);
  }

  static markAllMessagesRead() {
    return RNMarketingCloudSDK.markAllMessagesRead();
  }

  static markAllMessagesDeleted() {
    return RNMarketingCloudSDK.markAllMessagesDeleted();
  }

  static refreshMessages() {
    return RNMarketingCloudSDK.refreshMessages();
  }

  /**
   * Intelligence Methods
   */

  static trackMessageOpened(message) {
    return RNMarketingCloudSDK.trackMessageOpened(message);
  }

  static trackPageView(url, title, item, search) {
    return RNMarketingCloudSDK.trackPageView(url, title, item, search);
  }

  static trackCartContents(cartItems) {
    return RNMarketingCloudSDK.trackCartContents(cartItems);
  }

  static buildCartItem(price, quantity, item, uniqueId) {
    return RNMarketingCloudSDK.buildCartItem(price, quantity, item, uniqueId);
  }

  static buildCart(cartItems) {
    return RNMarketingCloudSDK.buildCart(cartItems);
  }

  static buildOrder(orderNumber, shipping, discount, cart) {
    return RNMarketingCloudSDK.buildOrder(orderNumber, shipping, discount, cart);
  }

  /**
   * Location Methods
   */

  static locationEnabled(enabled) {
    return RNMarketingCloudSDK.locationEnabled(enabled);
  }

  static startWatchingLocation() {
    return RNMarketingCloudSDK.startWatchingLocation();
  }

  static stopWatchingLocation() {
    return RNMarketingCloudSDK.stopWatchingLocation();
  }

  static watchingLocation() {
    return RNMarketingCloudSDK.watchingLocation();
  }

  static lastKnownLocation() {
    return RNMarketingCloudSDK.lastKnownLocation();
  }
}

export default MarketingCloudSDK;
