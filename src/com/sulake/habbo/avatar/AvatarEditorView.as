package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITabSelectorWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.enum.AvatarEditorFigureCategory;
   import com.sulake.habbo.avatar.enum.AvatarEditorSideCategory;
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class AvatarEditorView
   {
      
      public static var var_1416:IWindowContainer;
      
      public static var var_1712:IWindowContainer;
      
      public static var var_2242:int = 6710886;
      
      private static const const_1658:int = 5000;
      
      private static const const_1459:Point = new Point(100,30);
       
      
      private var var_23:HabboAvatarEditor;
      
      private var var_60:IWindowContainer;
      
      private var var_420:String;
      
      private var var_258:ITabSelectorWindow;
      
      private var var_91:IFrameWindow;
      
      private var var_715:IWindowContainer;
      
      private var var_350:IFrameWindow;
      
      private var var_714:Timer;
      
      private var var_1656:String;
      
      private var var_2892:Boolean = true;
      
      private var var_1350:Array;
      
      private var var_1527:Array;
      
      public function AvatarEditorView(param1:HabboAvatarEditor, param2:Array)
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         this.var_1350 = [];
         this.var_1527 = [AvatarEditorFigureCategory.const_1030,AvatarEditorFigureCategory.const_55,AvatarEditorFigureCategory.const_256,AvatarEditorFigureCategory.const_764,AvatarEditorFigureCategory.HOTLOOKS,AvatarEditorFigureCategory.const_114];
         super();
         this.var_23 = param1;
         if(var_1416 == null)
         {
            _loc4_ = this.var_23.manager.assets.getAssetByName("AvatarEditorThumb") as XmlAsset;
            var_1416 = this.var_23.manager.windowManager.buildFromXML(_loc4_.content as XML) as IWindowContainer;
         }
         if(var_1712 == null)
         {
            _loc5_ = this.var_23.manager.assets.getAssetByName("color_chooser_cell") as XmlAsset;
            var_1712 = this.var_23.manager.windowManager.buildFromXML(_loc5_.content as XML) as IWindowContainer;
         }
         this.var_714 = new Timer(const_1658,1);
         this.var_714.addEventListener(TimerEvent.TIMER,this.onUpdate);
         if(param2 == null)
         {
            param2 = this.var_1527;
         }
         for each(_loc3_ in param2)
         {
            this.var_1350.push(_loc3_);
         }
         this.createWindow();
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this.var_714 != null)
         {
            this.var_714.stop();
            this.var_714.removeEventListener(TimerEvent.TIMER,this.onUpdate);
            this.var_714 = null;
         }
         if(this.var_258)
         {
            this.var_258.dispose();
            this.var_258 = null;
         }
         if(this.var_350)
         {
            this.var_350.dispose();
            this.var_350 = null;
         }
         if(this.var_60)
         {
            this.var_60.dispose();
            this.var_60 = null;
         }
         if(this.var_715 != null)
         {
            this.var_715.dispose();
            this.var_715 = null;
         }
         if(this.var_91)
         {
            this.var_91.dispose();
            this.var_91 = null;
         }
         if(this.var_60 != null)
         {
            _loc1_ = this.var_60.findChildByName("figureContainer") as IWindowContainer;
            if(_loc1_ != null)
            {
               while(_loc1_.numChildren > 0)
               {
                  _loc1_.removeChildAt(0);
               }
            }
            _loc2_ = this.var_60.findChildByName("contentArea") as IWindowContainer;
            if(_loc2_ != null)
            {
               while(_loc2_.numChildren > 0)
               {
                  _loc2_.removeChildAt(0);
               }
            }
            _loc3_ = this.var_60.findChildByName("sideContainer") as IWindowContainer;
            if(_loc3_ != null)
            {
               while(_loc3_.numChildren > 0)
               {
                  _loc3_.removeChildAt(0);
               }
            }
            this.var_23 = null;
         }
      }
      
      public function getFrame(param1:Array, param2:String = null) : IFrameWindow
      {
         if(this.var_91)
         {
            this.var_91.visible = true;
            this.var_91.activate();
            return this.var_91;
         }
         if(this.var_91)
         {
            this.var_91.dispose();
            this.var_91 = null;
         }
         var _loc3_:XmlAsset = this.var_23.manager.assets.getAssetByName("AvatarEditorFrame") as XmlAsset;
         if(_loc3_)
         {
            this.var_91 = this.var_23.manager.windowManager.buildFromXML(_loc3_.content as XML) as IFrameWindow;
         }
         if(this.var_91 == null)
         {
            Logger.log("Failed to construct Avatar editor window!");
            return null;
         }
         var _loc4_:IWindowContainer = this.var_91.findChildByName("maincontent") as IWindowContainer;
         if(!this.embedToContext(_loc4_,param1))
         {
            this.var_91.dispose();
            this.var_91 = null;
            return null;
         }
         if(param2)
         {
            this.var_91.header.title.text = param2;
         }
         this.var_91.position = const_1459;
         this.var_91.findChildByName("header_button_close").procedure = this.windowEventProc;
         return this.var_91;
      }
      
      public function embedToContext(param1:IWindowContainer, param2:Array) : Boolean
      {
         var _loc3_:int = 0;
         if(!this.validateAvailableCategories(param2))
         {
            Logger.log("Could not validate categories for avatar editor!");
            return false;
         }
         if(param1)
         {
            _loc3_ = param1.getChildIndex(this.var_60);
            if(_loc3_)
            {
               param1.removeChildAt(_loc3_);
            }
            param1.addChild(this.var_60);
         }
         else
         {
            if(this.var_715 == null)
            {
               this.var_715 = this.var_23.manager.windowManager.createWindow("avatarEditorContainer","",HabboWindowType.const_77,HabboWindowStyle.const_31,0 | 0,new Rectangle(0,0,2,2),null,0) as IWindowContainer;
               this.var_715.addChild(this.var_60);
            }
            _loc3_ = this.var_715.getChildIndex(this.var_60);
            if(_loc3_)
            {
               param1.removeChildAt(_loc3_);
            }
            this.var_715.visible = true;
         }
         return true;
      }
      
      public function validateAvailableCategories(param1:Array) : Boolean
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return this.validateAvailableCategories(this.var_1527);
         }
         if(param1.length != this.var_1350.length)
         {
            return false;
         }
         for each(_loc2_ in param1)
         {
            if(this.var_1350.indexOf(_loc2_) < 0)
            {
               return false;
            }
         }
         return true;
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         this.var_714.stop();
         if(this.var_60)
         {
            this.var_60.findChildByName("save").enable();
         }
      }
      
      public function show() : void
      {
         if(this.var_91)
         {
            this.var_91.visible = true;
         }
         else if(this.var_60)
         {
            this.var_60.visible = true;
         }
      }
      
      public function hide() : void
      {
         if(this.var_91)
         {
            this.var_91.visible = false;
         }
         else if(this.var_60)
         {
            this.var_60.visible = false;
         }
      }
      
      private function createWindow() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(this.var_60 == null)
         {
            this.var_60 = this.var_23.manager.windowManager.buildFromXML((this.var_23.manager.assets.getAssetByName("AvatarEditorContent") as XmlAsset).content as XML) as IWindowContainer;
         }
         this.var_60.procedure = this.windowEventProc;
         this.var_258 = this.var_60.findChildByName("mainTabs") as ITabSelectorWindow;
         var _loc1_:int = this.var_258.numSelectables - 1;
         while(_loc1_ >= 0)
         {
            _loc2_ = this.var_258.getSelectableAt(_loc1_);
            if(_loc2_ != null && this.var_1350.indexOf(_loc2_.name) < 0)
            {
               _loc3_ = this.var_258.removeSelectable(_loc2_);
               _loc4_ = _loc1_ + 1;
               while(_loc4_ < this.var_258.numSelectables)
               {
                  this.var_258.getSelectableAt(_loc4_).x = this.var_258.getSelectableAt(_loc4_).x - _loc3_.width;
                  _loc4_++;
               }
            }
            _loc1_--;
         }
         this.var_258.setSelected(this.var_258.getSelectableAt(0));
         this.attachImages();
         this.update();
      }
      
      private function attachImages() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc1_:Array = this.var_1527;
         var _loc2_:Point = new Point();
         for each(_loc3_ in _loc1_)
         {
            _loc4_ = this.var_60.findChildByName(_loc3_) as IWindowContainer;
            if(_loc4_ != null)
            {
               _loc5_ = _loc4_.findChildByTag("BITMAP") as IBitmapWrapperWindow;
               if(_loc5_ != null)
               {
                  _loc6_ = this.var_23.manager.assets.getAssetByName("ae_tabs_" + _loc3_) as BitmapDataAsset;
                  _loc7_ = _loc6_.content as BitmapData;
                  _loc5_.bitmap = new BitmapData(_loc5_.width,_loc5_.height,true,16777215);
                  _loc2_.x = (_loc5_.width - _loc7_.width) / 2;
                  _loc2_.y = (_loc5_.height - _loc7_.height) / 2;
                  _loc5_.bitmap.copyPixels(_loc7_,_loc7_.rect,_loc2_);
               }
            }
         }
      }
      
      public function update() : void
      {
         var _loc1_:IWindowContainer = this.var_23.figureData.view.window;
         var _loc2_:IWindowContainer = this.var_60.findChildByName("figureContainer") as IWindowContainer;
         if(_loc2_.numChildren > 0)
         {
            _loc2_.removeChildAt(0);
         }
         if(_loc2_ != null)
         {
            _loc2_.addChild(_loc1_);
         }
         var _loc3_:IContainerButtonWindow = this.var_60.findChildByName("wardrobe") as IContainerButtonWindow;
         if(_loc3_ && this.var_23.manager.sessionData)
         {
            _loc3_.visible = this.var_23.manager.sessionData.clubLevel >= HabboClubLevelEnum.const_35 && this.var_23.isSideContentEnabled();
         }
         var _loc4_:String = "null";
         if(this.var_23.manager.sessionData && this.var_23.manager.sessionData.clubLevel >= HabboClubLevelEnum.const_35 && (this.var_1656 == AvatarEditorSideCategory.const_114 || this.var_2892))
         {
            _loc4_ = "null";
         }
         if(this.var_23.isClubTryoutAllowed() && this.var_23.clubMemberLevel <= 0)
         {
            _loc4_ = "null";
         }
         if(!this.var_23.isSideContentEnabled())
         {
            _loc4_ = "null";
         }
         this.setSideContent(_loc4_);
         this.setViewToCategory(this.var_420);
      }
      
      public function toggleCategoryView(param1:String, param2:Boolean = false) : void
      {
         if(!param2)
         {
         }
         this.setViewToCategory(param1);
      }
      
      private function toggleWardrobe() : void
      {
         if(this.var_1656 == AvatarEditorSideCategory.const_114)
         {
            this.var_2892 = false;
            this.setSideContent(AvatarEditorSideCategory.const_629);
         }
         else
         {
            this.setSideContent(AvatarEditorSideCategory.const_114);
         }
      }
      
      private function setSideContent(param1:String) : void
      {
         var _loc5_:int = 0;
         if(this.var_1656 == param1)
         {
            return;
         }
         var _loc2_:IWindowContainer = this.var_60.findChildByName("sideContainer") as IWindowContainer;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:* = null;
         switch(param1)
         {
            case AvatarEditorSideCategory.const_629:
               break;
            case AvatarEditorSideCategory.const_569:
               _loc3_ = this.var_23.getSideContentWindowContainer(AvatarEditorSideCategory.const_569);
               break;
            case AvatarEditorSideCategory.const_114:
               _loc3_ = this.var_23.getSideContentWindowContainer(AvatarEditorSideCategory.const_114);
         }
         var _loc4_:IWindow = _loc2_.removeChildAt(0);
         if(_loc4_)
         {
            this.var_60.width -= _loc4_.width;
         }
         if(_loc3_)
         {
            _loc2_.addChild(_loc3_);
            _loc3_.visible = true;
            _loc2_.width = _loc3_.width;
         }
         else
         {
            _loc2_.width = 0;
         }
         this.var_1656 = param1;
         if(this.var_91)
         {
            _loc5_ = 8;
            this.var_91.content.width = this.var_60.width + _loc5_;
         }
      }
      
      private function setViewToCategory(param1:String) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1 == "")
         {
            return;
         }
         var _loc2_:IWindowContainer = this.var_60.findChildByName("contentArea") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IWindowContainer = _loc2_.getChildAt(0) as IWindowContainer;
         _loc2_.removeChild(_loc3_);
         _loc2_.invalidate();
         var _loc4_:IWindowContainer = this.var_23.getCategoryWindowContainer(param1);
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.visible = true;
         _loc2_.addChild(_loc4_);
         this.var_420 = param1;
         this.var_258.setSelected(this.var_258.getSelectableByName(param1));
      }
      
      public function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type == WindowEvent.const_47)
         {
            _loc3_ = param2.name;
            Logger.log("Select tab: " + _loc3_);
            if(_loc3_ != this.var_420)
            {
               this.var_23.toggleAvatarEditorPage(_loc3_);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "save":
                  if(this.var_23.hasInvalidClubItems())
                  {
                     this.displayStripClubDialog();
                     return;
                  }
                  this.var_714.start();
                  this.var_60.findChildByName("save").disable();
                  this.var_23.saveCurrentSelection();
                  this.var_23.manager.close(this.var_23.instanceId);
                  break;
               case "cancel":
                  this.var_23.manager.close(this.var_23.instanceId);
                  break;
               case "wardrobe":
                  this.toggleWardrobe();
                  break;
               case "header_button_close":
                  this.var_23.manager.close(this.var_23.instanceId);
            }
         }
      }
      
      private function displayStripClubDialog() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!this.var_350)
         {
            _loc1_ = this.var_23.manager.assets.getAssetByName("StripClubItemsInfo");
            if(!_loc1_)
            {
               Logger.log("Failed to initialize strip club info dialog; missing asset!");
               return;
            }
            _loc2_ = _loc1_.content as XML;
            this.var_350 = this.var_23.manager.windowManager.buildFromXML(_loc2_,2) as IFrameWindow;
            this.var_350.procedure = this.stripClubDialogEventProc;
            this.var_350.center();
         }
         else
         {
            this.var_350.visible = true;
            this.var_350.center();
         }
      }
      
      private function stripClubDialogEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "header_button_close":
                  this.var_350.visible = false;
                  if(this.var_23.manager.communication)
                  {
                     this.var_23.manager.communication.getHabboMainConnection(null).send(new EventLogMessageComposer("AvatarEditor","click","strip_club_items_close",""));
                  }
                  break;
               case "strip_button_ok":
                  if(this.var_23)
                  {
                     this.var_23.stripClubItems();
                  }
                  this.var_350.visible = false;
                  if(this.var_23.manager.communication)
                  {
                     this.var_23.manager.communication.getHabboMainConnection(null).send(new EventLogMessageComposer("AvatarEditor","click","strip_club_items_ok",""));
                  }
                  break;
               case "strip_button_club_info":
                  this.openCatalogClubPage();
                  this.var_350.visible = false;
                  if(this.var_23.manager.communication)
                  {
                     this.var_23.manager.communication.getHabboMainConnection(null).send(new EventLogMessageComposer("AvatarEditor","click","strip_club_items_info",""));
                  }
            }
         }
      }
      
      private function openCatalogClubPage() : void
      {
         if(this.var_23.manager.catalog)
         {
            this.var_23.manager.catalog.openCatalogPage(CatalogPageName.const_142,true);
         }
      }
   }
}
