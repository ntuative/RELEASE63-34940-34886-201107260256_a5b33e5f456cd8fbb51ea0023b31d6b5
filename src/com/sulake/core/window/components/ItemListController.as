package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowStyle;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.graphics.WindowRedrawFlag;
   import com.sulake.core.window.utils.IInputProcessorRoot;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.core.window.utils.Iterator;
   import com.sulake.core.window.utils.PropertyDefaults;
   import com.sulake.core.window.utils.PropertyStruct;
   import flash.geom.Rectangle;
   
   public class ItemListController extends WindowController implements IItemListWindow, IInputProcessorRoot
   {
       
      
      protected var var_757:Number;
      
      protected var var_755:Number;
      
      protected var var_126:Number;
      
      protected var var_109:Number;
      
      protected var _container:IWindowContainer;
      
      protected var var_2279:Boolean = false;
      
      protected var var_606:Boolean = false;
      
      protected var _spacing:int = 0;
      
      protected var _horizontal:Boolean = false;
      
      protected var var_758:Number = -1.0;
      
      protected var var_756:Number = -1.0;
      
      protected var var_1149:Boolean = true;
      
      protected var var_511:Boolean = false;
      
      protected var var_1427:Boolean = false;
      
      protected var var_2278:int = 0;
      
      protected var var_2280:int = 0;
      
      protected var var_1425:Number;
      
      protected var var_1424:Number;
      
      protected var var_1426:Boolean = false;
      
      public function ItemListController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         this.var_757 = 0;
         this.var_755 = 0;
         this.var_126 = 0;
         this.var_109 = 0;
         this._horizontal = param2 == WindowType.const_410;
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         var_193 = var_516 || !testParamFlag(WindowParam.const_33);
         this._container = _context.create("_CONTAINER","",WindowType.const_422,WindowStyle.const_103,0 | 0 | 0,new Rectangle(0,0,width,height),null,this,0,null,[TAG_INTERNAL,TAG_EXCLUDE]) as IWindowContainer;
         this._container.addEventListener(WindowEvent.const_40,this.containerEventHandler);
         this._container.addEventListener(WindowEvent.const_421,this.containerEventHandler);
         this._container.addEventListener(WindowEvent.const_167,this.containerEventHandler);
         this._container.addEventListener(WindowEvent.const_233,this.containerEventHandler);
         this._container.clipping = clipping;
         this.resizeOnItemUpdate = this.var_1427;
      }
      
      public function get spacing() : int
      {
         return this._spacing;
      }
      
      public function set spacing(param1:int) : void
      {
         if(param1 != this._spacing)
         {
            this._spacing = param1;
            this.updateScrollAreaRegion();
         }
      }
      
      public function get scrollH() : Number
      {
         return this.var_757;
      }
      
      public function get scrollV() : Number
      {
         return this.var_755;
      }
      
      public function get maxScrollH() : int
      {
         return Math.max(0,this.var_126 - width);
      }
      
      public function get maxScrollV() : int
      {
         return Math.max(0,this.var_109 - height);
      }
      
      public function get visibleRegion() : Rectangle
      {
         return new Rectangle(this.var_757 * this.maxScrollH,this.var_755 * this.maxScrollV,width,height);
      }
      
      public function get scrollableRegion() : Rectangle
      {
         return this._container.rectangle.clone();
      }
      
      public function set scrollH(param1:Number) : void
      {
         var _loc2_:* = null;
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 1)
         {
            param1 = 1;
         }
         if(param1 != this.var_757)
         {
            this.var_757 = param1;
            this._container.x = -this.var_757 * this.maxScrollH;
            _context.invalidate(this._container,this.visibleRegion,WindowRedrawFlag.const_62);
            _loc2_ = WindowEvent.allocate(WindowEvent.const_527,this,null);
            _events.dispatchEvent(_loc2_);
            _loc2_.recycle();
         }
      }
      
      public function set scrollV(param1:Number) : void
      {
         var _loc2_:* = null;
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 1)
         {
            param1 = 1;
         }
         if(param1 != this.var_755)
         {
            this.var_755 = param1;
            this._container.y = -this.var_755 * this.maxScrollV;
            _loc2_ = WindowEvent.allocate(WindowEvent.const_527,this,null);
            _events.dispatchEvent(_loc2_);
            _loc2_.recycle();
         }
      }
      
      public function get scrollStepH() : Number
      {
         if(this.var_758 >= 0)
         {
            return this.var_758;
         }
         return !!this._horizontal ? Number(this._container.width / this.numListItems) : Number(0.1 * this._container.width);
      }
      
      public function get scrollStepV() : Number
      {
         if(this.var_756 >= 0)
         {
            return this.var_756;
         }
         return !!this._horizontal ? Number(0.1 * this._container.height) : Number(this._container.height / this.numListItems);
      }
      
      public function set scrollStepH(param1:Number) : void
      {
         this.var_758 = param1;
      }
      
      public function set scrollStepV(param1:Number) : void
      {
         this.var_756 = param1;
      }
      
      public function set scaleToFitItems(param1:Boolean) : void
      {
         if(this.var_511 != param1)
         {
            this.var_511 = param1;
            this.updateScrollAreaRegion();
         }
      }
      
      public function get scaleToFitItems() : Boolean
      {
         return this.var_511;
      }
      
      public function set autoArrangeItems(param1:Boolean) : void
      {
         this.var_1149 = param1;
         this.updateScrollAreaRegion();
      }
      
      public function get autoArrangeItems() : Boolean
      {
         return this.var_1149;
      }
      
      public function set resizeOnItemUpdate(param1:Boolean) : void
      {
         this.var_1427 = param1;
         if(this._container)
         {
            if(this._horizontal)
            {
               this._container.setParamFlag(WindowParam.const_585,param1);
            }
            else
            {
               this._container.setParamFlag(WindowParam.const_667,param1);
            }
         }
      }
      
      public function get resizeOnItemUpdate() : Boolean
      {
         return this.var_1427;
      }
      
      public function get iterator() : IIterator
      {
         return new Iterator(this);
      }
      
      public function get firstListItem() : IWindow
      {
         return this.numListItems > 0 ? this.getListItemAt(0) : null;
      }
      
      public function get lastListItem() : IWindow
      {
         return this.numListItems > 0 ? this.getListItemAt(this.numListItems - 1) : null;
      }
      
      override public function set clipping(param1:Boolean) : void
      {
         super.clipping = param1;
         if(this._container)
         {
            this._container.clipping = param1;
         }
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            if(this.var_1426)
            {
               try
               {
                  _context.getWindowServices().getGestureAgentService().end(this);
               }
               catch(e:Error)
               {
               }
            }
            this._container.removeEventListener(WindowEvent.const_40,this.containerEventHandler);
            this._container.removeEventListener(WindowEvent.const_421,this.containerEventHandler);
            this._container.removeEventListener(WindowEvent.const_167,this.containerEventHandler);
            this._container.removeEventListener(WindowEvent.const_233,this.containerEventHandler);
            super.dispose();
         }
      }
      
      override protected function cloneChildWindows(param1:WindowController) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.numListItems)
         {
            IItemListWindow(param1).addListItem(this.getListItemAt(_loc2_).clone());
            _loc2_++;
         }
      }
      
      public function get numListItems() : int
      {
         return this._container != null ? int(this._container.numChildren) : 0;
      }
      
      public function addListItem(param1:IWindow) : IWindow
      {
         this.var_606 = true;
         if(this._horizontal)
         {
            param1.x = this.var_126 + (this.numListItems > 0 ? this._spacing : 0);
            this.var_126 = param1.rectangle.right;
            this._container.width = this.var_126;
         }
         else
         {
            if(this.autoArrangeItems)
            {
               param1.y = this.var_109 + (this.numListItems > 0 ? this._spacing : 0);
               this.var_109 = param1.rectangle.bottom;
            }
            else
            {
               this.var_109 = Math.max(this.var_109,param1.rectangle.bottom);
            }
            this._container.height = this.var_109;
         }
         param1 = this._container.addChild(param1);
         this.var_606 = false;
         return param1;
      }
      
      public function addListItemAt(param1:IWindow, param2:uint) : IWindow
      {
         param1 = this._container.addChildAt(param1,param2);
         this.updateScrollAreaRegion();
         return param1;
      }
      
      public function getListItemAt(param1:uint) : IWindow
      {
         return this._container.getChildAt(param1);
      }
      
      public function getListItemByID(param1:uint) : IWindow
      {
         return this._container.getChildByID(param1);
      }
      
      public function getListItemByName(param1:String) : IWindow
      {
         return this._container.getChildByName(param1);
      }
      
      public function getListItemByTag(param1:String) : IWindow
      {
         return this._container.getChildByTag(param1);
      }
      
      public function getListItemIndex(param1:IWindow) : int
      {
         return this._container.getChildIndex(param1);
      }
      
      public function removeListItem(param1:IWindow) : IWindow
      {
         param1 = this._container.removeChild(param1);
         if(param1)
         {
            this.updateScrollAreaRegion();
         }
         return param1;
      }
      
      public function removeListItemAt(param1:int) : IWindow
      {
         return this._container.removeChildAt(param1);
      }
      
      public function setListItemIndex(param1:IWindow, param2:int) : void
      {
         this._container.setChildIndex(param1,param2);
      }
      
      public function swapListItems(param1:IWindow, param2:IWindow) : void
      {
         this._container.swapChildren(param1,param2);
         this.updateScrollAreaRegion();
      }
      
      public function swapListItemsAt(param1:int, param2:int) : void
      {
         this._container.swapChildrenAt(param1,param2);
         this.updateScrollAreaRegion();
      }
      
      public function groupListItemsWithID(param1:uint, param2:Array, param3:Boolean = false) : uint
      {
         return this._container.groupChildrenWithID(param1,param2,param3);
      }
      
      public function groupListItemsWithTag(param1:String, param2:Array, param3:Boolean = false) : uint
      {
         return this._container.groupChildrenWithTag(param1,param2,param3);
      }
      
      public function removeListItems() : void
      {
         this.var_606 = true;
         while(this.numListItems > 0)
         {
            this._container.removeChildAt(0);
         }
         this.var_606 = false;
         this.updateScrollAreaRegion();
      }
      
      public function destroyListItems() : void
      {
         this.var_606 = true;
         while(this.numListItems > 0)
         {
            this._container.removeChildAt(0).destroy();
         }
         this.var_606 = false;
         this.updateScrollAreaRegion();
      }
      
      public function arrangeListItems() : void
      {
         this.updateScrollAreaRegion();
      }
      
      override public function populate(param1:Array) : void
      {
         WindowController(this._container).populate(param1);
         this.updateScrollAreaRegion();
      }
      
      override public function update(param1:WindowController, param2:WindowEvent) : Boolean
      {
         var _loc3_:Boolean = super.update(param1,param2);
         switch(param2.type)
         {
            case WindowEvent.const_1408:
               this.var_2279 = true;
               break;
            case WindowEvent.const_40:
               if(!this.var_511)
               {
                  if(this._horizontal)
                  {
                     this._container.height = var_10.height;
                  }
                  else
                  {
                     this._container.width = var_10.width;
                  }
               }
               this.updateScrollAreaRegion();
               this.var_2279 = false;
               break;
            default:
               if(param2 is WindowEvent)
               {
                  _loc3_ = this.process(param2 as WindowEvent);
               }
         }
         return _loc3_;
      }
      
      public function process(param1:WindowEvent) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param1 is WindowMouseEvent)
         {
            _loc3_ = WindowMouseEvent(param1).localX;
            _loc4_ = WindowMouseEvent(param1).localY;
            _loc5_ = WindowMouseEvent(param1).delta;
         }
         switch(param1.type)
         {
            case WindowMouseEvent.const_360:
               if(this._horizontal)
               {
                  this.scrollH -= _loc5_ * 0.01;
               }
               else
               {
                  this.scrollV -= _loc5_ * 0.01;
               }
               _loc2_ = true;
               break;
            case WindowMouseEvent.const_44:
               this.var_2278 = _loc3_;
               this.var_2280 = _loc4_;
               this.var_1425 = 0;
               this.var_1424 = 0;
               this.var_1426 = true;
               _loc2_ = true;
               break;
            case WindowMouseEvent.const_195:
               if(this.var_1426)
               {
                  this.var_1425 = this.var_2278 - _loc3_;
                  this.var_1424 = this.var_2280 - _loc4_;
                  if(this._horizontal)
                  {
                     if(this.var_1425 != 0 && this.var_126 != 0)
                     {
                        this.scrollH += this.var_1425 / this.var_126;
                     }
                  }
                  else if(this.var_1424 != 0 && this.var_109 != 0)
                  {
                     this.scrollV += this.var_1424 / this.var_109;
                  }
                  this.var_2278 = _loc3_;
                  this.var_2280 = _loc4_;
                  _loc2_ = true;
               }
               break;
            case WindowMouseEvent.const_56:
            case WindowMouseEvent.const_280:
               if(this.var_1426)
               {
                  if(this._horizontal)
                  {
                     _context.getWindowServices().getGestureAgentService().begin(this,this.scrollAnimationCallback,0,-this.var_1425,0);
                  }
                  else
                  {
                     _context.getWindowServices().getGestureAgentService().begin(this,this.scrollAnimationCallback,0,0,-this.var_1424);
                  }
                  this.var_1426 = false;
                  _loc2_ = true;
               }
         }
         return _loc2_;
      }
      
      private function scrollAnimationCallback(param1:int, param2:int) : void
      {
         if(!disposed)
         {
            this.scrollH -= param1 / this.var_126;
            this.scrollV -= param2 / this.var_109;
         }
      }
      
      private function containerEventHandler(param1:WindowEvent) : void
      {
         var _loc2_:* = null;
         switch(param1.type)
         {
            case WindowEvent.const_421:
               this.updateScrollAreaRegion();
               break;
            case WindowEvent.const_167:
               if(!this.var_2279)
               {
                  this.updateScrollAreaRegion();
               }
               break;
            case WindowEvent.const_233:
               this.updateScrollAreaRegion();
               break;
            case WindowEvent.const_40:
               _loc2_ = WindowEvent.allocate(WindowEvent.const_40,this,null);
               _events.dispatchEvent(_loc2_);
               _loc2_.recycle();
               break;
            default:
               Logger.log("ItemListController::containerEventHandler(" + param1.type + ")");
         }
      }
      
      protected function updateScrollAreaRegion() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this.var_1149 && !this.var_606 && this._container)
         {
            this.var_606 = true;
            _loc1_ = uint(this._container.numChildren);
            if(this._horizontal)
            {
               this.var_126 = 0;
               this.var_109 = var_10.height;
               _loc4_ = 0;
               while(_loc4_ < _loc1_)
               {
                  _loc2_ = this._container.getChildAt(_loc4_);
                  if(_loc2_.visible)
                  {
                     _loc2_.x = this.var_126;
                     this.var_126 += _loc2_.width + this._spacing;
                     if(this.var_511)
                     {
                        _loc3_ = _loc2_.height + _loc2_.y;
                        this.var_109 = _loc3_ > this.var_109 ? Number(_loc3_) : Number(this.var_109);
                     }
                  }
                  _loc4_++;
               }
               if(_loc1_ > 0)
               {
                  this.var_126 -= this._spacing;
               }
            }
            else
            {
               this.var_126 = var_10.width;
               this.var_109 = 0;
               _loc4_ = 0;
               while(_loc4_ < _loc1_)
               {
                  _loc2_ = this._container.getChildAt(_loc4_);
                  if(_loc2_.visible)
                  {
                     _loc2_.y = this.var_109;
                     this.var_109 += _loc2_.height + this._spacing;
                     if(this.var_511)
                     {
                        _loc3_ = _loc2_.width + _loc2_.x;
                        this.var_126 = _loc3_ > this.var_126 ? Number(_loc3_) : Number(this.var_126);
                     }
                  }
                  _loc4_++;
               }
               if(_loc1_ > 0)
               {
                  this.var_109 -= this._spacing;
               }
            }
            if(this.var_757 > 0)
            {
               if(this.var_126 <= var_10.width)
               {
                  this.scrollH = 0;
               }
               else
               {
                  this._container.x = -(this.var_757 * this.maxScrollH);
               }
            }
            if(this.var_755 > 0)
            {
               if(this.var_109 <= var_10.height)
               {
                  this.scrollV = 0;
               }
               else
               {
                  this._container.y = -(this.var_755 * this.maxScrollV);
               }
            }
            this._container.height = this.var_109;
            this._container.width = this.var_126;
            this.var_606 = false;
         }
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         if(this._spacing != PropertyDefaults.const_775)
         {
            _loc1_.push(new PropertyStruct(PropertyDefaults.const_454,this._spacing,PropertyStruct.const_36,true));
         }
         else
         {
            _loc1_.push(PropertyDefaults.const_1373);
         }
         if(this.var_1149 != PropertyDefaults.const_1202)
         {
            _loc1_.push(new PropertyStruct(PropertyDefaults.const_839,this.var_1149,PropertyStruct.const_37,true));
         }
         else
         {
            _loc1_.push(PropertyDefaults.const_1935);
         }
         if(this.var_511 != PropertyDefaults.const_1357)
         {
            _loc1_.push(new PropertyStruct(PropertyDefaults.const_979,this.var_511,PropertyStruct.const_37,true));
         }
         else
         {
            _loc1_.push(PropertyDefaults.const_1768);
         }
         if(this.var_1427 != PropertyDefaults.const_1279)
         {
            _loc1_.push(new PropertyStruct(PropertyDefaults.const_802,this.var_1427,PropertyStruct.const_37,true));
         }
         else
         {
            _loc1_.push(PropertyDefaults.const_1829);
         }
         if(this.var_758 != PropertyDefaults.const_1322)
         {
            _loc1_.push(new PropertyStruct(PropertyDefaults.const_942,this.var_758,PropertyStruct.const_134,true));
         }
         else
         {
            _loc1_.push(PropertyDefaults.const_2053);
         }
         if(this.var_756 != PropertyDefaults.const_1264)
         {
            _loc1_.push(new PropertyStruct(PropertyDefaults.const_956,this.var_756,PropertyStruct.const_134,true));
         }
         else
         {
            _loc1_.push(PropertyDefaults.const_1758);
         }
         return _loc1_;
      }
      
      override public function set properties(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case PropertyDefaults.const_454:
                  this.spacing = _loc2_.value as int;
                  break;
               case PropertyDefaults.const_979:
                  this.scaleToFitItems = _loc2_.value as Boolean;
                  break;
               case PropertyDefaults.const_802:
                  this.resizeOnItemUpdate = _loc2_.value as Boolean;
                  break;
               case PropertyDefaults.const_839:
                  this.var_1149 = _loc2_.value as Boolean;
                  break;
               case PropertyDefaults.const_942:
                  this.var_758 = _loc2_.value as Number;
                  break;
               case PropertyDefaults.const_956:
                  this.var_756 = _loc2_.value as Number;
                  break;
            }
         }
         super.properties = param1;
      }
   }
}
