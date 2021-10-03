package com.sulake.habbo.friendbar.stream
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.localization.ILocalization;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.friendlist.EventStreamData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.EventStreamEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.GetEventStreamComposer;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.SetEventStreamingAllowedComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.friendbar.HabboFriendBar;
   import com.sulake.habbo.friendbar.iid.IIDHabboFriendBarView;
   import com.sulake.habbo.friendbar.utils.LinkTarget;
   import com.sulake.habbo.friendbar.utils.TestMessageWrapper;
   import com.sulake.habbo.friendbar.view.*;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class HabboEventStream extends AbstractView implements IHabboEventStream
   {
      
      private static const const_711:String = "list";
      
      private static const const_468:String = "header";
      
      private static const const_1185:String = "badge";
      
      private static const CLOSE:String = "close";
      
      private static const const_1124:String = "open_settings";
      
      private static const const_1125:String = "close_settings";
      
      private static const const_710:String = "settings";
      
      private static const const_712:String = "check_stream";
      
      private static const const_1603:String = "see_more";
      
      private static const const_1605:uint = 0;
      
      private static const const_2115:uint = 1;
      
      private static const const_1609:uint = 4293519841;
      
      private static const const_1602:uint = 4292467926;
      
      private static const const_713:int = -2;
      
      private static const const_1606:int = -3;
      
      private static const const_1123:int = 42;
      
      private static const const_1608:int = 60000;
      
      private static const const_1607:int = 30000;
      
      private static const const_1604:String = "friendbar.stream.";
       
      
      private var var_2056:int = 1;
      
      private var _window:IWindowContainer;
      
      private var var_695:Vector.<EventStreamEntity>;
      
      private var _connection:IConnection;
      
      private var var_850:Boolean = false;
      
      private var var_697:Timer;
      
      private var var_94:IHabboCommunicationManager;
      
      private var var_145:IHabboConfigurationManager;
      
      private var var_696:Timer;
      
      private var var_2816:IHabboFriendBarView;
      
      private var var_1051:Boolean;
      
      private var var_1602:Vector.<int>;
      
      private var var_1603:Boolean = false;
      
      private var var_2055:Boolean = false;
      
      private var var_2815:Array;
      
      private var var_2814:Array;
      
      private var var_1604:Map;
      
      public function HabboEventStream(param1:HabboFriendBar, param2:uint, param3:IAssetLibrary)
      {
         this.var_1602 = new Vector.<int>();
         this.var_2815 = ["friend_made","room_liked","achievement_earned","motto_changed","room_decorated"];
         this.var_2814 = ["no_link","open_mini_profile","visit_room","open_achievements","open_motto_changer","friend_request"];
         this.var_1604 = new Map();
         super(param1,param2,param3);
         this.var_695 = new Vector.<EventStreamEntity>();
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerAvailable);
         queueInterface(new IIDHabboFriendBarView(),this.onFriendBarViewAvailable);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationAvailable);
         this.var_1604.add("m","his");
         this.var_1604.add("f","her");
         if(!this.var_696)
         {
            this.var_696 = new Timer(const_1607);
            this.var_696.addEventListener(TimerEvent.TIMER,this.onRefreshTimerEvent);
            this.var_696.start();
         }
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(!this._window)
         {
            this.setupUserInterface();
         }
         this._window.visible = param1;
         if(param1)
         {
            this._window.x = this._window.desktop.width - (this._window.width + const_1606);
            this._window.y = const_713;
            this._window.height = this._window.desktop.height - (const_713 + const_1123);
            this._window.activate();
            this.requestEventStreamData(this.var_2056);
         }
      }
      
      public function get visible() : Boolean
      {
         return !!this._window ? Boolean(this._window.visible) : false;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_697)
            {
               this.var_697.stop();
               this.var_697.removeEventListener(TimerEvent.TIMER,this.onMinuteTimerEvent);
               this.var_697 = null;
            }
            if(this.var_696)
            {
               this.var_696.stop();
               this.var_696.removeEventListener(TimerEvent.TIMER,this.onRefreshTimerEvent);
               this.var_696 = null;
            }
            while(this.var_695.length > 0)
            {
               this.var_695.pop().dispose();
            }
            if(false)
            {
               EventStreamEntity.name_6.dispose();
            }
            EventStreamEntity.name_6 = null;
            EventStreamEntity.var_2233 = null;
            EventStreamEntity.ASSETS = null;
            if(this._window)
            {
               this._window.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseClick);
               this._window.dispose();
               this._window = null;
            }
            super.dispose();
         }
      }
      
      private function clearStreamList() : void
      {
         var _loc1_:IItemListWindow = this._window.findChildByName(const_711) as IItemListWindow;
         _loc1_.destroyListItems();
         while(this.var_695.length > 0)
         {
            this.var_695.pop().dispose();
         }
      }
      
      public function populate(param1:Vector.<EventStreamData>) : void
      {
         var _loc2_:* = false;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(!this._window)
         {
            this.setupUserInterface();
         }
         if(this.visible)
         {
            this.clearStreamList();
            _loc2_ = this.var_695.length % 2 == 0;
            _loc4_ = this._window.findChildByName(const_711) as IItemListWindow;
            _loc5_ = 0;
            for each(_loc6_ in param1)
            {
               _loc3_ = EventStreamEntity.allocate();
               _loc3_.title = _loc6_.accountName;
               _loc3_.message = this.resolveMessageText(_loc6_);
               _loc3_.linkTarget = this.resolveLinkTarget(_loc6_);
               _loc3_.imageFilePath = this.resolveImagePath(_loc6_);
               _loc3_.minutesElapsed = _loc6_.minutesSinceEvent;
               _loc3_.window.color = !!_loc2_ ? uint(const_1609) : uint(const_1602);
               this.var_695.push(_loc3_);
               _loc4_.addListItem(_loc3_.window);
               _loc2_ = !_loc2_;
               if(this.var_1602.indexOf(_loc6_.id) == -1)
               {
                  _loc5_++;
                  this.var_1602.push(_loc6_.id);
               }
            }
            if(param1.length == 0)
            {
            }
            _loc7_ = this._window.findChildByName(const_468) as IItemListWindow;
            _loc8_ = _loc7_.getListItemByName(const_1185);
            _loc8_.caption = String(_loc5_);
            _loc8_.visible = _loc5_ != 0;
            this.var_1603 = false;
         }
         else
         {
            for each(_loc9_ in param1)
            {
               if(this.var_1602.indexOf(_loc9_.id) == -1)
               {
                  this.var_1603 = true;
                  break;
               }
            }
         }
      }
      
      private function resolveMessageText(param1:EventStreamData) : String
      {
         var _loc6_:* = null;
         var _loc2_:int = param1.actionId;
         var _loc3_:String = "friendbar.stream.type." + this.var_2815[_loc2_];
         var _loc4_:ILocalization = var_318.getLocalization(_loc3_);
         if(!_loc4_)
         {
            return _loc3_;
         }
         var _loc5_:String = _loc4_.raw;
         switch(_loc2_)
         {
            case EventStreamData.const_641:
               _loc5_ = _loc5_.replace("%targetString%",param1.extraDataStruct.friendName);
               break;
            case EventStreamData.const_1011:
               _loc5_ = _loc5_.replace("%targetString%",param1.extraDataStruct.roomName);
               break;
            case EventStreamData.const_875:
               _loc5_ = _loc5_.replace("%targetString%",var_318.getAchievementName(param1.extraDataStruct.achievementCode));
               break;
            case EventStreamData.const_1318:
               _loc6_ = var_318.getLocalization(const_1604 + this.var_1604.getValue(param1.accountGender));
               _loc5_ = _loc5_.replace("%gender%",_loc6_.value);
               _loc5_ = _loc5_.replace("%targetString%",param1.extraDataStruct.motto);
               break;
            case EventStreamData.const_2013:
         }
         return _loc5_;
      }
      
      private function resolveLinkTarget(param1:EventStreamData) : LinkTarget
      {
         var _loc3_:* = null;
         var _loc2_:String = "friendbar.stream.link." + this.var_2814[param1.linkTargetType];
         var _loc4_:int = 0;
         var _loc5_:* = 0;
         var _loc6_:* = null;
         var _loc7_:ILocalization = var_318.getLocalization(_loc2_);
         _loc3_ = !!_loc7_ ? _loc7_.raw : "";
         switch(param1.linkTargetType)
         {
            case EventStreamData.const_1990:
               _loc4_ = 0;
               _loc3_ = "";
               break;
            case EventStreamData.const_1214:
               _loc3_ = _loc3_.replace("%targetString%",param1.extraDataStruct.friendName);
               _loc4_ = 0;
               _loc5_ = uint(param1.extraDataStruct.friendId);
               break;
            case EventStreamData.const_2005:
               _loc4_ = 0;
               _loc5_ = uint(param1.extraDataStruct.roomId);
               break;
            case EventStreamData.const_1848:
               _loc4_ = 0;
               break;
            case EventStreamData.LINK_TARGET_OPEN_MOTTO_CHANGER:
               _loc4_ = 0;
               _loc5_ = 0;
               break;
            case EventStreamData.const_1937:
               _loc3_ = _loc3_.replace("%targetString%",param1.extraDataStruct.friendName);
               _loc4_ = 0;
               _loc5_ = uint(param1.extraDataStruct.friendId);
               _loc6_ = param1.extraDataStruct.friendName;
         }
         return new LinkTarget(_loc3_,_loc4_,_loc5_,_loc6_);
      }
      
      private function resolveImagePath(param1:EventStreamData) : String
      {
         var _loc2_:String = param1.imageFilePath;
         var _loc3_:int = param1.actionId;
         switch(_loc3_)
         {
            case EventStreamData.const_641:
               break;
            case EventStreamData.const_1011:
               break;
            case EventStreamData.const_875:
         }
         return _loc2_;
      }
      
      private function setupUserInterface() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!this._window)
         {
            this._window = _windowManager.buildFromXML(assets.getAssetByName("event_stream_display_xml").content as XML) as IWindowContainer;
            this._window.height = this._window.desktop.height - (const_713 + const_1123);
            this._window.setParamFlag(WindowParam.const_339);
            this._window.setParamFlag(WindowParam.const_316);
            this._window.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseClick);
            this._window.findChildByName(CLOSE).addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseClick);
            this._window.findChildByName(const_1124).addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseClick);
            this._window.findChildByName(const_1125).addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseClick);
            this._window.visible = false;
            _loc1_ = IWindowContainer(this._window.findChildByName(const_710));
            _loc1_.visible = !this.var_1051;
            _loc1_.procedure = this.settingsEventProc;
            ISelectableWindow(_loc1_.findChildByName(const_712)).isSelected = this.var_1051;
            _loc2_ = this._window.findChildByName(const_711) as IItemListWindow;
            _loc3_ = _loc2_.removeListItemAt(0) as IWindowContainer;
            EventStreamEntity.name_6 = _loc3_;
            EventStreamEntity.var_2233 = var_318;
            EventStreamEntity.ASSETS = assets;
            if(!this.var_697)
            {
               this.var_697 = new Timer(const_1608);
               this.var_697.addEventListener(TimerEvent.TIMER,this.onMinuteTimerEvent);
               this.var_697.start();
            }
         }
      }
      
      private function onMouseClick(param1:WindowMouseEvent) : void
      {
         switch(param1.target.name)
         {
            case CLOSE:
               this.visible = false;
               break;
            case const_1124:
               this._window.findChildByName(const_710).visible = true;
               break;
            case const_1125:
               this._window.findChildByName(const_710).visible = false;
         }
      }
      
      private function settingsEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case const_1603:
                  _windowManager.alert("${catalog.alert.external.link.title}","${catalog.alert.external.link.desc}",0,null);
                  HabboWebTools.openWebPage(var_947.getKey("link.friendbar.stream.settings.see.more",""));
            }
         }
         if(param1.type == WindowEvent.const_47)
         {
            switch(param2.name)
            {
               case const_712:
                  this.var_1051 = true;
                  this.sendSetEventStreamingEnabled(true);
                  Logger.log("Streaming enabled");
            }
         }
         else if(param1.type == WindowEvent.const_420)
         {
            switch(param2.name)
            {
               case const_712:
                  this.var_1051 = false;
                  this.sendSetEventStreamingEnabled(false);
                  Logger.log("Streaming disabled");
            }
         }
      }
      
      private function onMinuteTimerEvent(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_695)
         {
            _loc2_.minutesElapsed += 1;
         }
      }
      
      private function onRefreshTimerEvent(param1:TimerEvent) : void
      {
         if(this.visible || !this.var_1603)
         {
            this.requestEventStreamData(this.var_2056);
         }
      }
      
      private function requestEventStreamData(param1:uint) : void
      {
         if(this._connection && this._connection.connected && this.var_2055)
         {
            this._connection.send(new GetEventStreamComposer(param1 == const_1605 ? 0 : int(GetEventStreamComposer.const_1847)));
            this.var_850 = true;
            Logger.log("Requested stream events in mode " + param1);
         }
      }
      
      private function onCommunicationManagerAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_94 = param2 as IHabboCommunicationManager;
         this.var_94.addHabboConnectionMessageEvent(new EventStreamEvent(this.onEventStreamEvent));
         this.var_94.addHabboConnectionMessageEvent(new UserObjectEvent(this.onUserObjectEvent));
         this._connection = this.var_94.getHabboMainConnection(this.onConnectionInstanceAvailable);
      }
      
      private function onConnectionInstanceAvailable(param1:IConnection) : void
      {
         this._connection = param1;
      }
      
      private function onEventStreamEvent(param1:EventStreamEvent) : void
      {
         this.populate(param1.events);
         this.var_2816.setStreamIconNotify(!this.visible && this.var_1603);
      }
      
      private function testEventStream(param1:int = 1) : void
      {
         var _loc2_:Vector.<EventStreamData> = new Vector.<EventStreamData>();
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            _loc2_.push(new EventStreamData(_loc3_,EventStreamData.const_641,String(_loc3_ * 1000),"FooBar" + _loc3_,"m","http://d63.varoke.net/habbo-imaging/badge/b1003Xs05175s05173s091145ec244dcc5eaf54aaabf367665f39c67.gif",_loc3_,EventStreamData.const_1214,new TestMessageWrapper(["1234","Friend\'s friend" + _loc3_])));
            _loc3_++;
         }
         this.populate(_loc2_);
      }
      
      private function onFriendBarViewAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_2816 = param2 as IHabboFriendBarView;
      }
      
      private function onConfigurationAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_145 = param2 as IHabboConfigurationManager;
         if(this.var_145.getKey("friendbar.stream.enabled","false") == "true")
         {
            this.var_2055 = true;
         }
         else
         {
            this.var_2055 = false;
         }
      }
      
      private function sendSetEventStreamingEnabled(param1:Boolean) : void
      {
         if(this._connection && this._connection.connected)
         {
            this._connection.send(new SetEventStreamingAllowedComposer(param1));
         }
      }
      
      private function onUserObjectEvent(param1:UserObjectEvent) : void
      {
         this.var_1051 = param1.getParser().streamPublishingAllowed;
         Logger.log("Stream events allowed " + this.var_1051);
      }
      
      public function refreshEventStream() : void
      {
         this.requestEventStreamData(this.var_2056);
      }
   }
}
