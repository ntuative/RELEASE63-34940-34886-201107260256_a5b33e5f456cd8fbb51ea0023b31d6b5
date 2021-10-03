package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_366:int = 1;
      
      public static const const_205:int = 2;
      
      public static const const_273:int = 3;
      
      public static const const_348:int = 4;
      
      public static const const_286:int = 5;
      
      public static const const_432:int = 1;
      
      public static const const_973:int = 2;
      
      public static const const_850:int = 3;
      
      public static const const_933:int = 4;
      
      public static const const_282:int = 5;
      
      public static const const_855:int = 6;
      
      public static const const_1012:int = 7;
      
      public static const const_403:int = 8;
      
      public static const const_620:int = 9;
      
      public static const const_2308:int = 10;
      
      public static const const_917:int = 11;
      
      public static const const_654:int = 12;
       
      
      private var var_486:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_486 = new Array();
         this.var_486.push(new Tab(this._navigator,const_366,const_654,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_584));
         this.var_486.push(new Tab(this._navigator,const_205,const_432,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_584));
         this.var_486.push(new Tab(this._navigator,const_348,const_917,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1227));
         this.var_486.push(new Tab(this._navigator,const_273,const_282,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_584));
         this.var_486.push(new Tab(this._navigator,const_286,const_403,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_1324));
         this.setSelectedTab(const_366);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_348;
      }
      
      public function get tabs() : Array
      {
         return this.var_486;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_486)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_486)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_486)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
