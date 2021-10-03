package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.ToggleStaffPickMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboNavigatorEvent;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var var_194:IWindowContainer;
      
      private var var_3103:int;
      
      private var var_413:RoomEventViewCtrl;
      
      private var var_414:Timer;
      
      private var var_161:RoomSettingsCtrl;
      
      private var var_303:RoomThumbnailCtrl;
      
      private var var_1092:TagRenderer;
      
      private var var_411:IWindowContainer;
      
      private var var_412:IWindowContainer;
      
      private var var_722:IWindowContainer;
      
      private var var_2142:IWindowContainer;
      
      private var var_2139:IWindowContainer;
      
      private var var_1368:IWindowContainer;
      
      private var var_1022:ITextWindow;
      
      private var var_1089:ITextWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_894:ITextWindow;
      
      private var var_1365:ITextWindow;
      
      private var var_1090:ITextWindow;
      
      private var var_891:ITextWindow;
      
      private var var_1668:ITextWindow;
      
      private var var_304:IWindowContainer;
      
      private var var_895:IWindowContainer;
      
      private var var_1671:IWindowContainer;
      
      private var var_2140:ITextWindow;
      
      private var var_723:ITextWindow;
      
      private var var_2141:IWindow;
      
      private var var_1367:IContainerButtonWindow;
      
      private var var_1369:IContainerButtonWindow;
      
      private var var_1366:IContainerButtonWindow;
      
      private var _remFavouriteButton:IContainerButtonWindow;
      
      private var var_1364:IContainerButtonWindow;
      
      private var var_1667:IButtonWindow;
      
      private var var_1666:IButtonWindow;
      
      private var var_1670:IButtonWindow;
      
      private var var_893:IWindowContainer;
      
      private var var_1370:ITextWindow;
      
      private var var_1091:ITextFieldWindow;
      
      private var _buttons:IWindowContainer;
      
      private var var_892:IButtonWindow;
      
      private var var_1669:Boolean = false;
      
      private const const_864:int = 75;
      
      private const const_987:int = 3;
      
      private const const_848:int = 45;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_413 = new RoomEventViewCtrl(this._navigator);
         this.var_161 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_303 = new RoomThumbnailCtrl(this._navigator);
         this.var_1092 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_161);
         this.var_414 = new Timer(6000,1);
         this.var_414.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function dispose() : void
      {
         if(this.var_414)
         {
            this.var_414.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_414.reset();
            this.var_414 = null;
         }
         this._navigator = null;
         this.var_413 = null;
         this.var_161 = null;
         this.var_303 = null;
         if(this.var_1092)
         {
            this.var_1092.dispose();
            this.var_1092 = null;
         }
         this.var_194 = null;
         this.var_411 = null;
         this.var_412 = null;
         this.var_722 = null;
         this.var_2142 = null;
         this.var_2139 = null;
         this.var_1368 = null;
         this.var_1022 = null;
         this.var_1089 = null;
         this._ownerName = null;
         this.var_894 = null;
         this.var_1365 = null;
         this.var_1090 = null;
         this.var_891 = null;
         this.var_1668 = null;
         this.var_304 = null;
         this.var_895 = null;
         this.var_1671 = null;
         this.var_2140 = null;
         this.var_723 = null;
         this.var_2141 = null;
         this.var_1367 = null;
         this.var_1369 = null;
         this.var_1366 = null;
         this._remFavouriteButton = null;
         this.var_1364 = null;
         this.var_1667 = null;
         this.var_1666 = null;
         this.var_1670 = null;
         this.var_893 = null;
         this.var_1370 = null;
         this.var_1091 = null;
         this._buttons = null;
         this.var_892 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function startEventEdit() : void
      {
         this.var_414.reset();
         this.var_413.active = true;
         this.var_161.active = false;
         this.var_303.active = false;
         this.reload();
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_414.reset();
         this.var_161.load(param1);
         this.var_161.active = true;
         this.var_413.active = false;
         this.var_303.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function backToRoomSettings() : void
      {
         this.var_161.active = true;
         this.var_413.active = false;
         this.var_303.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_414.reset();
         this.var_161.active = false;
         this.var_413.active = false;
         this.var_303.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      public function close() : void
      {
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this.var_1669 = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      public function toggle() : void
      {
         this.var_414.reset();
         this.var_413.active = false;
         this.var_161.active = false;
         this.var_303.active = false;
         this.refresh();
         this._window.visible = !this._window.visible;
         this._window.x = this._window.desktop.width - this._window.width - this.const_987;
         this._window.y = this.const_864;
         if(this._navigator.configuration.getBoolean("club.membership.extend.promotion.enabled",false))
         {
            this._window.y = 91;
         }
         if(this._window.visible)
         {
            this._window.activate();
         }
      }
      
      private function refresh() : void
      {
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         this.refreshButtons();
         Util.moveChildrenToColumn(this.var_194,["room_info","event_info","embed_info","buttons_container"],0,2);
         this.var_194.height = Util.getLowestPoint(this.var_194);
         var _loc1_:int = this._window.desktop.height - this._window.height - this.const_848;
         if(this._window.y > _loc1_)
         {
            this._window.y = _loc1_ < 0 ? 0 : int(_loc1_);
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_411);
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_161.refresh(this.var_411);
         this.var_303.refresh(this.var_411);
         Util.moveChildrenToColumn(this.var_411,["room_details","room_buttons"],0,2);
         this.var_411.height = Util.getLowestPoint(this.var_411);
         this.var_411.visible = true;
         Logger.log("XORP: " + this.var_412.visible + ", " + this.var_1368.visible + ", " + this.var_722.visible + ", " + this.var_722.rectangle + ", " + this.var_411.rectangle);
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_304);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_413.refresh(this.var_304);
         if(Util.hasVisibleChildren(this.var_304) && !(this.var_161.active || this.var_303.active))
         {
            Util.moveChildrenToColumn(this.var_304,["event_details","event_buttons"],0,2);
            this.var_304.height = Util.getLowestPoint(this.var_304);
            this.var_304.visible = true;
         }
         else
         {
            this.var_304.visible = false;
         }
         Logger.log("EVENT: " + this.var_304.visible + ", " + this.var_304.rectangle);
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_161.active && !this.var_303.active && !this.var_413.active)
         {
            this.var_893.visible = true;
            this.var_1091.text = this.getEmbedData();
         }
         else
         {
            this.var_893.visible = false;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this._buttons)
         {
            return;
         }
         if(this.var_161.active)
         {
            this._buttons.visible = false;
            return;
         }
         this._buttons.visible = true;
         if(this.var_892)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_892.visible = _loc1_;
            if(this.var_1669)
            {
               this.var_892.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_892.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_161.active || this.var_303.active)
         {
            return;
         }
         this.var_1022.text = param1.roomName;
         this.var_1022.height = this.var_1022.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_894.text = param1.description;
         this.var_1092.refreshTags(this.var_412,param1.tags);
         this.var_894.visible = false;
         if(param1.description != "")
         {
            this.var_894.height = this.var_894.textHeight + 5;
            this.var_894.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1369,"facebook_logo_small",_loc3_,null,0);
         this.var_1369.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this.var_1367,"thumb_up",_loc4_,null,0);
         this.var_1367.visible = _loc4_;
         this.var_891.visible = !_loc4_;
         this.var_1668.visible = !_loc4_;
         this.var_1668.text = "" + this._navigator.data.currentRoomRating;
         this.refreshStuffPick();
         this._navigator.refreshButton(this.var_412,"home",param2,null,0);
         this._navigator.refreshButton(this.var_412,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_412,["room_name","owner_name_cont","tags","room_desc","rating_cont","staff_pick_button"],this.var_1022.y,0);
         this.var_412.visible = true;
         this.var_412.height = Util.getLowestPoint(this.var_412);
      }
      
      private function refreshStuffPick() : void
      {
         var _loc1_:IWindow = this.var_412.findChildByName("staff_pick_button");
         if(!this._navigator.data.roomPicker)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
         _loc1_.caption = this._navigator.getText(!!this._navigator.data.currentRoomIsStaffPick ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick");
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_161.active || this.var_303.active)
         {
            return;
         }
         this.var_1089.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_1089.height = this.var_1089.textHeight + 5;
         this.var_1365.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1365.height = this.var_1365.textHeight + 5;
         Util.moveChildrenToColumn(this.var_722,["public_space_name","public_space_desc"],this.var_1089.y,0);
         this.var_722.visible = true;
         this.var_722.height = Math.max(86,Util.getLowestPoint(this.var_722));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_413.active)
         {
            return;
         }
         this.var_2140.text = param1.eventName;
         this.var_723.text = param1.eventDescription;
         this.var_1092.refreshTags(this.var_895,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_723.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_723.height = this.var_723.textHeight + 5;
            this.var_723.y = Util.getLowestPoint(this.var_895) + 2;
            this.var_723.visible = true;
         }
         this.var_895.visible = true;
         this.var_895.height = Util.getLowestPoint(this.var_895);
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_161.active || this.var_303.active)
         {
            return;
         }
         this.var_1667.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1366.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this._remFavouriteButton.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1364.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1368.visible = Util.hasVisibleChildren(this.var_1368);
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_413.active)
         {
            return;
         }
         this.var_1666.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1670.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1671.visible = Util.hasVisibleChildren(this.var_1671);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details_framed"));
         this.var_194 = this._window.findChildByName("content") as IWindowContainer;
         this._window.visible = false;
         this.var_411 = IWindowContainer(this.find("room_info"));
         this.var_412 = IWindowContainer(this.find("room_details"));
         this.var_722 = IWindowContainer(this.find("public_space_details"));
         this.var_2142 = IWindowContainer(this.find("owner_name_cont"));
         this.var_2139 = IWindowContainer(this.find("rating_cont"));
         this.var_1368 = IWindowContainer(this.find("room_buttons"));
         this.var_1022 = ITextWindow(this.find("room_name"));
         this.var_1089 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_894 = ITextWindow(this.find("room_desc"));
         this.var_1365 = ITextWindow(this.find("public_space_desc"));
         this.var_1090 = ITextWindow(this.find("owner_caption"));
         this.var_891 = ITextWindow(this.find("rating_caption"));
         this.var_1668 = ITextWindow(this.find("rating_txt"));
         this.var_304 = IWindowContainer(this.find("event_info"));
         this.var_895 = IWindowContainer(this.find("event_details"));
         this.var_1671 = IWindowContainer(this.find("event_buttons"));
         this.var_2140 = ITextWindow(this.find("event_name"));
         this.var_723 = ITextWindow(this.find("event_desc"));
         this.var_1369 = IContainerButtonWindow(this.find("facebook_like_button"));
         this.var_1367 = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_2141 = this.find("staff_pick_button");
         this.var_1366 = IContainerButtonWindow(this.find("add_favourite_button"));
         this._remFavouriteButton = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1364 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1667 = IButtonWindow(this.find("room_settings_button"));
         this.var_1666 = IButtonWindow(this.find("create_event_button"));
         this.var_1670 = IButtonWindow(this.find("edit_event_button"));
         this.var_893 = IWindowContainer(this.find("embed_info"));
         this.var_1370 = ITextWindow(this.find("embed_info_txt"));
         this.var_1091 = ITextFieldWindow(this.find("embed_src_txt"));
         this._buttons = IWindowContainer(this.find("buttons_container"));
         this.var_892 = IButtonWindow(this.find("zoom_button"));
         this.addMouseClickListener(this.var_1366,this.onAddFavouriteClick);
         this.addMouseClickListener(this._remFavouriteButton,this.onRemoveFavouriteClick);
         this.addMouseClickListener(this.var_1667,this.onRoomSettingsClick);
         this.addMouseClickListener(this.var_1364,this.onMakeHomeClick);
         this.addMouseClickListener(this.var_1666,this.onEventSettingsClick);
         this.addMouseClickListener(this.var_1670,this.onEventSettingsClick);
         this.addMouseClickListener(this.var_1091,this.onEmbedSrcClick);
         this.addMouseClickListener(this.var_1367,this.onThumbUp);
         this.addMouseClickListener(this.var_2141,this.onStaffPick);
         this.addMouseClickListener(this.var_1369,this.onFacebookLike);
         this.addMouseClickListener(this.var_892,this.onZoomClick);
         this._navigator.refreshButton(this.var_1366,"favourite",true,null,0);
         this._navigator.refreshButton(this._remFavouriteButton,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1364,"home",true,null,0);
         this.addMouseClickListener(this._window.findChildByTag("close"),this.onCloseButtonClick);
         this.addMouseOverListener(this.var_411,this.onHover);
         this.addMouseOverListener(this.var_304,this.onHover);
         this.var_1090.width = this.var_1090.textWidth;
         Util.moveChildrenToRow(this.var_2142,["owner_caption","owner_name"],this.var_1090.x,this.var_1090.y,3);
         this.var_891.width = this.var_891.textWidth;
         Util.moveChildrenToRow(this.var_2139,["rating_caption","rating_txt"],this.var_891.x,this.var_891.y,3);
         this.var_1370.height = this.var_1370.textHeight + 5;
         Util.moveChildrenToColumn(this.var_893,["embed_info_txt","embed_src_txt"],this.var_1370.y,2);
         this.var_893.height = Util.getLowestPoint(this.var_893) + 5;
         this.var_3103 = this._window.y + this._window.height;
      }
      
      private function addMouseClickListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,param2);
         }
      }
      
      private function addMouseOverListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,param2);
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent) : void
      {
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc2_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc2_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent) : void
      {
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onEventSettingsClick(param1:WindowEvent) : void
      {
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      private function onRoomSettingsClick(param1:WindowEvent) : void
      {
         var _loc2_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc2_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc2_.flatId);
      }
      
      private function onMakeHomeClick(param1:WindowEvent) : void
      {
         var _loc2_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc2_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc2_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc2_.flatId));
      }
      
      private function onCloseButtonClick(param1:WindowEvent) : void
      {
         this.hideInfo(null);
      }
      
      private function onThumbUp(param1:WindowEvent) : void
      {
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function onStaffPick(param1:WindowEvent) : void
      {
         this._navigator.send(new ToggleStaffPickMessageComposer(this._navigator.data.enteredGuestRoom.flatId,this._navigator.data.currentRoomIsStaffPick));
      }
      
      private function onFacebookLike(param1:WindowEvent) : void
      {
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent) : void
      {
         this.var_1091.setSelection(0,this.var_1091.text.length);
      }
      
      private function onZoomClick(param1:WindowEvent) : void
      {
         this._navigator.events.dispatchEvent(new HabboNavigatorEvent(HabboNavigatorEvent.const_334));
         this.var_1669 = !this.var_1669;
         this.refreshButtons();
      }
      
      private function onHover(param1:WindowEvent) : void
      {
         this.var_414.reset();
      }
      
      private function hideInfo(param1:Event) : void
      {
         this._window.visible = false;
         if(this.var_161 != null)
         {
            this.var_161.resetView();
         }
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
   }
}
