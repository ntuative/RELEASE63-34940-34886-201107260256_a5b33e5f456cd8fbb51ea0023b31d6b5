package com.sulake.habbo.ui.widget.furniture.teaser
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.events.RoomWidgetTeaserDataUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetConversionPointMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetViralFurniMessage;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   
   public class TeaserFurniWidget extends RoomWidgetBase
   {
       
      
      private var var_157:IHabboConfigurationManager;
      
      private var var_12:IHabboInventory;
      
      private var _window:IFrameWindow;
      
      private var var_1465:int = -1;
      
      private var var_435:int = -1;
      
      private var _shareId:String;
      
      private var var_239:int = -1;
      
      private var var_1467:Array;
      
      private var var_1466:String;
      
      private var var_198:String;
      
      private var var_1464:int = 0;
      
      private const const_2098:int = 0;
      
      private const const_2094:int = 1;
      
      private const const_2096:int = 2;
      
      private const const_2095:int = 3;
      
      private const const_2093:int = 4;
      
      private const const_2372:int = 0;
      
      private const const_2370:int = 1;
      
      private const const_2375:int = 2;
      
      private const const_2376:int = 3;
      
      private const const_2374:int = 4;
      
      private const const_2377:int = 5;
      
      private const const_2099:String = "deco_img";
      
      private const const_2097:String = "dialog_bg";
      
      private const const_2378:String = "%campaign%_dialog_bg.png";
      
      private const const_387:String = "%campaign%_gift_package.png";
      
      private const const_2371:String = "%campaign%_gift_content.png";
      
      private const const_2373:String = "%campaign%_friend_gift_package.png";
      
      public function TeaserFurniWidget(param1:IRoomWidgetHandler, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IHabboLocalizationManager, param5:IHabboConfigurationManager, param6:IHabboInventory)
      {
         super(param1,param2,param3,param4);
         this.var_157 = param5;
         this.var_12 = param6;
         this.var_1467 = new Array();
         this.var_1466 = this.var_157.getKey("image.library.url","http://images.habbo.com/c_images/");
         this.var_1466 += "Viral/";
      }
      
      override public function dispose() : void
      {
         var _loc2_:* = null;
         if(disposed)
         {
            return;
         }
         this.hideInterface();
         if(this._window != null && !this._window.disposed)
         {
            this._window.dispose();
            this._window = null;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.var_1467.length)
         {
            _loc2_ = this.var_1467.pop();
            _loc2_.dispose();
            _loc1_++;
         }
         this.var_157 = null;
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetTeaserDataUpdateEvent.const_614,this.onObjectUpdate);
         param1.addEventListener(RoomWidgetTeaserDataUpdateEvent.const_934,this.onObjectUpdate);
         param1.addEventListener(RoomWidgetTeaserDataUpdateEvent.const_774,this.onObjectUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetTeaserDataUpdateEvent.const_614,this.onObjectUpdate);
      }
      
      private function onObjectUpdate(param1:RoomWidgetTeaserDataUpdateEvent) : void
      {
         var _loc2_:int = 0;
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc3_:String = param1.campaignID;
         switch(param1.type)
         {
            case RoomWidgetTeaserDataUpdateEvent.const_614:
               _loc2_ = this.const_2098;
               this._shareId = null;
               break;
            case RoomWidgetTeaserDataUpdateEvent.const_774:
               _loc4_ = param1.firstClickUserName;
               _loc5_ = param1.giftWasReceived;
               if(_loc5_)
               {
                  if(_loc4_ && _loc4_ != "")
                  {
                     _loc2_ = this.const_2095;
                     var_74.registerParameter("widget.furni.teaser.notify.unlocked.desc","username",_loc4_);
                  }
                  else
                  {
                     _loc2_ = this.const_2096;
                  }
               }
               else
               {
                  _loc2_ = this.const_2093;
               }
               this._shareId = null;
               this.var_1464 = param1.itemCategory;
               break;
            case RoomWidgetTeaserDataUpdateEvent.const_934:
               _loc2_ = this.const_2094;
               this.var_239 = param1.objectId;
               this._shareId = param1.data;
               this.var_435 = param1.status;
               this.var_1464 = param1.itemCategory;
               var_74.registerParameter("notifications.viral_furni.fb.title","realname",param1.ownRealName);
               var_74.registerParameter("notifications.viral_furni.fb.desc","realname",param1.ownRealName);
               var_74.registerParameter("widget.furni.teaser.gift.unlocked.desc","username",param1.firstClickUserName);
               break;
            default:
               Logger.log("Error, invalid viral widget update message: " + param1.type);
         }
         if(this._window && (this.var_1465 != _loc2_ || _loc3_ != this.var_198))
         {
            this._window.dispose();
            this._window = null;
         }
         this.var_198 = _loc3_;
         this.var_1465 = _loc2_;
         this.mainWindow;
         this.showInterface();
      }
      
      override public function get mainWindow() : IWindow
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(this.var_1465 == -1)
         {
            return null;
         }
         if(!this._window)
         {
            switch(this.var_1465)
            {
               case this.const_2098:
                  _loc1_ = assets.getAssetByName("notification_teaser") as XmlAsset;
                  _loc2_ = this.const_387;
                  this.sendConversionPoint("viral_val11","client.show.teaser");
                  break;
               case this.const_2094:
                  if(this.var_435 == this.const_2372)
                  {
                     _loc1_ = assets.getAssetByName("notification_gift_locked") as XmlAsset;
                     this.sendConversionPoint("viral_" + this.var_198,"client.show.locked");
                     _loc2_ = this.const_387;
                  }
                  else if(this.var_435 == this.const_2370)
                  {
                     _loc1_ = assets.getAssetByName("notification_gift_unlocked") as XmlAsset;
                     this.sendConversionPoint("viral_" + this.var_198,"client.show.unlocked");
                     _loc2_ = this.const_2371;
                  }
                  else if(this.var_435 == this.const_2375)
                  {
                     _loc1_ = assets.getAssetByName("notification_gift_alert") as XmlAsset;
                     this.sendConversionPoint("viral_" + this.var_198,"client.show.no_fb");
                     _loc3_ = var_74.getKey("widget.furni.teaser.gift.no_fb.title");
                     _loc4_ = var_74.getKey("widget.furni.teaser.gift.no_fb.desc");
                     _loc2_ = this.const_387;
                  }
                  else if(this.var_435 == this.const_2376)
                  {
                     _loc1_ = assets.getAssetByName("notification_gift_alert") as XmlAsset;
                     this.sendConversionPoint("viral_" + this.var_198,"client.show.not_enough_fb_friends");
                     _loc3_ = var_74.getKey("widget.furni.teaser.gift.no_spam.title");
                     _loc4_ = var_74.getKey("widget.furni.teaser.gift.no_spam.desc");
                     _loc2_ = this.const_387;
                  }
                  else if(this.var_435 == this.const_2374)
                  {
                     _loc1_ = assets.getAssetByName("notification_gift_alert") as XmlAsset;
                     this.sendConversionPoint("viral_" + this.var_198,"client.show.not_enough_fb_friends");
                     _loc3_ = var_74.getKey("widget.furni.teaser.gift.no_min_fb_friends.title");
                     _loc4_ = var_74.getKey("widget.furni.teaser.gift.no_min_fb_friends.desc");
                     _loc2_ = this.const_387;
                  }
                  else if(this.var_435 == this.const_2377)
                  {
                     _loc1_ = assets.getAssetByName("notification_gift_alert") as XmlAsset;
                     this.sendConversionPoint("viral_" + this.var_198,"client.show.campaign_closed");
                     _loc3_ = var_74.getKey("widget.furni.teaser.gift.campaign_closed.title","widget.furni.teaser.gift.campaign_closed.title");
                     _loc4_ = var_74.getKey("widget.furni.teaser.gift.campaign_closed.desc","widget.furni.teaser.gift.campaign_closed.desc");
                     _loc2_ = this.const_387;
                  }
                  break;
               case this.const_2096:
                  _loc1_ = assets.getAssetByName("notification_gift_received") as XmlAsset;
                  _loc2_ = this.const_2373;
                  break;
               case this.const_2095:
                  _loc1_ = assets.getAssetByName("notification_gift_unlocked_notify") as XmlAsset;
                  _loc2_ = this.const_387;
                  break;
               case this.const_2093:
                  _loc1_ = assets.getAssetByName("notification_gift_alert") as XmlAsset;
                  _loc3_ = var_74.getKey("widget.furni.teaser.gift.campaign_closed.title","widget.furni.teaser.gift.campaign_closed.title");
                  _loc4_ = var_74.getKey("widget.furni.teaser.gift.campaign_closed.desc","widget.furni.teaser.gift.campaign_closed.desc");
            }
            if(_loc1_ == null)
            {
               return null;
            }
            this._window = windowManager.buildFromXML(_loc1_.content as XML) as IFrameWindow;
            this._window.header.controls.visible = false;
            this._window.center();
            this._window.visible = false;
            _loc5_ = this.const_2378.replace("%campaign%",this.var_198);
            this.setDecoImage(_loc5_,this.const_2097);
            _loc2_ = _loc2_.replace("%campaign%",this.var_198);
            this.setDecoImage(_loc2_,this.const_2099);
            if(_loc3_)
            {
               _loc6_ = this._window.findChildByName("alert_title") as ITextWindow;
               _loc6_.text = _loc3_;
            }
            if(_loc4_)
            {
               _loc6_ = this._window.findChildByName("alert_desc") as ITextWindow;
               _loc6_.text = _loc4_;
            }
            _loc7_ = this._window.findChildByName("teaser_ok_btn");
            if(_loc7_ != null)
            {
               _loc7_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onTeaserOkButton);
            }
            _loc7_ = this._window.findChildByName("no_fb_btn");
            if(_loc7_ != null)
            {
               _loc7_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onNoFbButton);
            }
            _loc7_ = this._window.findChildByName("received_ok_btn");
            if(_loc7_ != null)
            {
               _loc7_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onReceivedOkButton);
            }
            _loc7_ = this._window.findChildByName("skip_btn");
            if(_loc7_ != null)
            {
               _loc7_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onSkipButton);
            }
            _loc7_ = this._window.findChildByName("post_btn");
            if(_loc7_ != null)
            {
               _loc7_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onPostButton);
            }
            _loc7_ = this._window.findChildByName("open_btn");
            if(_loc7_ != null)
            {
               _loc7_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onOpenButton);
            }
         }
         return this._window;
      }
      
      private function showInterface() : void
      {
         if(this._window == null)
         {
            return;
         }
         this._window.visible = true;
      }
      
      private function hideInterface() : void
      {
         if(this._window)
         {
            this._window.visible = false;
         }
      }
      
      private function onNoFbButton(param1:WindowEvent) : void
      {
         this.hideInterface();
      }
      
      private function onTeaserOkButton(param1:WindowEvent) : void
      {
         var _loc2_:* = null;
         if(messageListener != null)
         {
            _loc2_ = new RoomWidgetViralFurniMessage(RoomWidgetViralFurniMessage.const_1032);
            messageListener.processWidgetMessage(_loc2_);
         }
         this.hideInterface();
      }
      
      private function onReceivedOkButton(param1:WindowEvent) : void
      {
         this.hideInterface();
      }
      
      private function onSkipButton(param1:WindowEvent) : void
      {
         this.sendConversionPoint("viral_" + this.var_198,"client.skip_post");
         this.hideInterface();
      }
      
      private function onPostButton(param1:WindowEvent) : void
      {
         var _loc2_:String = var_74.getKey("notifications.viral_furni.fb.title");
         var _loc3_:String = var_74.getKey("notifications.viral_furni.fb.desc");
         this.sendConversionPoint("viral_" + this.var_198,"client.start_post",this._shareId);
         var _loc4_:String = this.var_157.getKey("viral.furni.post_type","feed");
         HabboWebTools.facebookViralGiftPost(this.var_198,_loc2_,_loc3_,this._shareId,_loc4_);
         this.hideInterface();
      }
      
      private function onOpenButton(param1:WindowEvent) : void
      {
         var _loc2_:* = null;
         if(messageListener != null)
         {
            _loc2_ = new RoomWidgetViralFurniMessage(RoomWidgetViralFurniMessage.const_189);
            _loc2_.objectId = this.var_239;
            messageListener.processWidgetMessage(_loc2_);
         }
         this.hideInterface();
         if(this.var_12)
         {
            if(this.var_1464 != 0)
            {
               this.var_12.toggleInventoryPage(this.var_1464 == 1 ? "null" : InventoryCategory.const_127);
            }
         }
         this.sendConversionPoint("viral_" + this.var_198,"client.open_gift");
      }
      
      private function sendConversionPoint(param1:String, param2:String, param3:String = "") : void
      {
         var _loc4_:* = null;
         if(messageListener != null)
         {
            _loc4_ = new RoomWidgetConversionPointMessage(RoomWidgetConversionPointMessage.const_807,"ViralGift",param1,param2,param3);
            messageListener.processWidgetMessage(_loc4_);
         }
      }
      
      private function setDecoImage(param1:String, param2:String) : void
      {
         var _loc3_:IBitmapWrapperWindow = this._window.findChildByName(param2) as IBitmapWrapperWindow;
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:IAsset = _assets.getAssetByName(param1);
         if(!_loc4_)
         {
            this.var_1467.push(new ImageDownloader(this,_assets,this.var_198,this.var_1466,param1,param2));
            return;
         }
         var _loc5_:BitmapData = (_loc4_.content as BitmapData).clone();
         switch(param2)
         {
            case this.const_2097:
            case this.const_2099:
               _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,0);
               _loc3_.bitmap.copyPixels(_loc5_,_loc5_.rect,new Point(0,_loc3_.height - _loc5_.height),null,null,true);
         }
      }
      
      function onDecoImageReady(param1:ImageDownloader) : void
      {
         if(disposed)
         {
            return;
         }
         if(!this._window || this.var_198 != param1.campaignID)
         {
            return;
         }
         var _loc2_:IAsset = _assets.getAssetByName(param1.imageName);
         if(!_loc2_)
         {
            return;
         }
         this.setDecoImage(param1.imageName,param1.viewElementID);
      }
   }
}
