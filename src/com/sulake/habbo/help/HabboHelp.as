package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var _toolbar:IHabboToolbar;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_284:IHabboCommunicationManager;
      
      private var var_318:IHabboLocalizationManager;
      
      private var var_947:IHabboConfigurationManager;
      
      private var var_423:ISessionDataManager;
      
      private var var_1222:FaqIndex;
      
      private var _incomingMessages:IncomingMessages;
      
      private var var_73:HelpUI;
      
      private var var_120:TutorialUI;
      
      private var var_793:HotelMergeUI;
      
      private var var_1498:CallForHelpData;
      
      private var var_2496:UserRegistry;
      
      private var var_2497:String = "";
      
      private var var_980:WelcomeScreenController;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_1498 = new CallForHelpData();
         this.var_2496 = new UserRegistry();
         super(param1,param2,param3);
         this._assetLibrary = param3;
         this.var_1222 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataManagerReady);
      }
      
      public function set ownUserName(param1:String) : void
      {
         this.var_2497 = param1;
      }
      
      public function get ownUserName() : String
      {
         return this.var_2497;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return this.var_1498;
      }
      
      public function get userRegistry() : UserRegistry
      {
         return this.var_2496;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_318;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return this._toolbar;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return this.var_423;
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return this.var_120;
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return this.var_793;
      }
      
      public function hasChangedName() : Boolean
      {
         if(this.var_120)
         {
            return this.var_120.hasChangedName;
         }
         return true;
      }
      
      override public function dispose() : void
      {
         if(this.var_73 != null)
         {
            this.var_73.dispose();
            this.var_73 = null;
         }
         if(this.var_120 != null)
         {
            this.var_120.dispose();
            this.var_120 = null;
         }
         if(this.var_793)
         {
            this.var_793.dispose();
            this.var_793 = null;
         }
         if(this.var_1222 != null)
         {
            this.var_1222.dispose();
            this.var_1222 = null;
         }
         this._incomingMessages = null;
         if(this._toolbar)
         {
            this._toolbar.release(new IIDHabboToolbar());
            this._toolbar = null;
         }
         if(this.var_318)
         {
            this.var_318.release(new IIDHabboLocalizationManager());
            this.var_318 = null;
         }
         if(this.var_284)
         {
            this.var_284.release(new IIDHabboCommunicationManager());
            this.var_284 = null;
         }
         if(this.var_947)
         {
            this.var_947.release(new IIDHabboConfigurationManager());
            this.var_947 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this.var_423 != null)
         {
            this.var_423.release(new IIDSessionDataManager());
            this.var_423 = null;
         }
         if(this.var_980 != null)
         {
            this.var_980.dispose();
            this.var_980 = null;
         }
         super.dispose();
      }
      
      public function showUI(param1:String = null) : void
      {
         if(this.var_73 != null)
         {
            this.var_73.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(this.var_73 != null)
         {
            this.var_73.hideUI();
         }
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(this.var_73 != null)
         {
            this.var_73.tellUI(param1,param2);
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(this.var_73 != null)
         {
            this.var_73.updateCallForGuideBotUI(true);
         }
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(this.var_73 != null)
         {
            this.var_73.updateCallForGuideBotUI(false);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return this.var_1222;
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(this.var_284 != null && param1 != null)
         {
            this.var_284.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(this.var_947 == null)
         {
            return param1;
         }
         return this.var_947.getKey(param1,param2,param3);
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(this.var_73 != null)
         {
            this.var_73.showCallForHelpReply(param1);
         }
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(this.var_73 != null)
         {
            this.var_73.showCallForHelpResult(param1);
         }
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         this.var_1498.reportedUserId = param1;
         this.var_1498.reportedUserName = param2;
         this.var_73.showUI(HabboHelpViewEnum.const_398);
      }
      
      private function toggleHelpUI() : void
      {
         if(this.var_73 == null)
         {
            if(!this.createHelpUI())
            {
               return;
            }
         }
         this.var_73.toggleUI();
      }
      
      private function createHelpUI() : Boolean
      {
         if(this.var_73 == null && this._assetLibrary != null && this._windowManager != null)
         {
            this.var_73 = new HelpUI(this,this._assetLibrary,this._windowManager);
         }
         return this.var_73 != null;
      }
      
      private function createTutorialUI() : Boolean
      {
         var _loc1_:* = false;
         if(this.var_120 == null && this._assetLibrary != null && this._windowManager != null)
         {
            _loc1_ = this.getConfigurationKey("avatar.widget.enabled","0") == "0";
            this.var_120 = new TutorialUI(this,_loc1_);
         }
         return this.var_120 != null;
      }
      
      public function removeTutorialUI() : void
      {
         if(this.var_120 != null)
         {
            this.var_120.dispose();
            this.var_120 = null;
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!this.var_793)
         {
            this.var_793 = new HotelMergeUI(this);
         }
         this.var_793.startNameChange();
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            this.removeTutorialUI();
            return;
         }
         if(this.var_120 == null)
         {
            if(!this.createTutorialUI())
            {
               return;
            }
         }
         this.var_120.update(param1,param2,param3);
      }
      
      public function startNameChange() : void
      {
         if(this.var_120)
         {
            this.var_120.showView(TutorialUI.const_329);
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_284 = IHabboCommunicationManager(param2);
         this._incomingMessages = new IncomingMessages(this,this.var_284);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._toolbar = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_318 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_947 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_79,this.onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_83,this.onRoomSessionEvent);
         this._toolbar.events.addEventListener(HabboToolbarEvent.const_49,this.onHabboToolbarEvent);
         this.createHelpUI();
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_423 = param2 as ISessionDataManager;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_79:
               if(this.var_73 != null)
               {
                  this.var_73.setRoomSessionStatus(true);
               }
               if(this.var_120 != null)
               {
                  this.var_120.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_83:
               if(this.var_73 != null)
               {
                  this.var_73.setRoomSessionStatus(false);
               }
               if(this.var_120 != null)
               {
                  this.var_120.setRoomSessionStatus(false);
               }
               this.userRegistry.unregisterRoom();
         }
      }
      
      public function showWelcomeScreen(param1:WelcomeNotification) : void
      {
         if(!this.var_980)
         {
            this.var_980 = new WelcomeScreenController(this,this._windowManager);
         }
         this.var_980.showWelcomeScreen(param1);
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_49)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               this.toggleHelpUI();
            }
         }
      }
   }
}
