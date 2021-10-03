package com.sulake.habbo.communication.messages.parser.moderation
{
   public class IssueMessageData
   {
      
      public static const const_184:int = 1;
      
      public static const const_426:int = 2;
      
      public static const const_1881:int = 3;
       
      
      private var var_2664:int;
      
      private var _state:int;
      
      private var var_1696:int;
      
      private var _reportedCategoryId:int;
      
      private var var_1959:int;
      
      private var _priority:int;
      
      private var var_2662:int = 0;
      
      private var var_2659:int;
      
      private var var_2661:String;
      
      private var var_1610:int;
      
      private var var_2071:String;
      
      private var var_2465:int;
      
      private var var_2657:String;
      
      private var _message:String;
      
      private var var_2660:int;
      
      private var var_1022:String;
      
      private var var_1655:int;
      
      private var var_2658:String;
      
      private var var_386:int;
      
      private var var_2663:String;
      
      private var var_2333:String;
      
      private var var_2630:int;
      
      private var var_2631:int;
      
      public function IssueMessageData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:String, param9:int, param10:String, param11:int, param12:String, param13:String, param14:int, param15:String, param16:int, param17:String, param18:int, param19:String, param20:String, param21:int, param22:int)
      {
         super();
         this.var_2664 = param1;
         this._state = param2;
         this.var_1696 = param3;
         this._reportedCategoryId = param4;
         this.var_1959 = param5;
         this._priority = param6;
         this.var_2659 = param7;
         this.var_2661 = param8;
         this.var_1610 = param9;
         this.var_2071 = param10;
         this.var_2465 = param11;
         this.var_2657 = param12;
         this._message = param13;
         this.var_2660 = param14;
         this.var_1022 = param15;
         this.var_1655 = param16;
         this.var_2658 = param17;
         this.var_386 = param18;
         this.var_2663 = param19;
         this.var_2333 = param20;
         this.var_2630 = param21;
         this.var_2631 = param22;
      }
      
      public function get issueId() : int
      {
         return this.var_2664;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function get categoryId() : int
      {
         return this.var_1696;
      }
      
      public function get reportedCategoryId() : int
      {
         return this._reportedCategoryId;
      }
      
      public function get timeStamp() : int
      {
         return this.var_1959;
      }
      
      public function get priority() : int
      {
         return this._priority + this.var_2662;
      }
      
      public function get reporterUserId() : int
      {
         return this.var_2659;
      }
      
      public function get reporterUserName() : String
      {
         return this.var_2661;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1610;
      }
      
      public function get reportedUserName() : String
      {
         return this.var_2071;
      }
      
      public function get pickerUserId() : int
      {
         return this.var_2465;
      }
      
      public function get pickerUserName() : String
      {
         return this.var_2657;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2660;
      }
      
      public function get roomName() : String
      {
         return this.var_1022;
      }
      
      public function get roomType() : int
      {
         return this.var_1655;
      }
      
      public function get flatType() : String
      {
         return this.var_2658;
      }
      
      public function get flatId() : int
      {
         return this.var_386;
      }
      
      public function get flatOwnerName() : String
      {
         return this.var_2663;
      }
      
      public function get roomResources() : String
      {
         return this.var_2333;
      }
      
      public function get unitPort() : int
      {
         return this.var_2630;
      }
      
      public function get worldId() : int
      {
         return this.var_2631;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         this.var_2662 = param1;
      }
      
      public function getOpenTime(param1:int) : String
      {
         var _loc2_:int = (param1 - this.var_1959) / 1000;
         var _loc3_:int = _loc2_ % 60;
         var _loc4_:int = _loc2_ / 60;
         var _loc5_:int = _loc4_ % 60;
         var _loc6_:int = _loc4_ / 60;
         var _loc7_:String = _loc3_ < 10 ? "0" + _loc3_ : "" + _loc3_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         var _loc9_:String = _loc6_ < 10 ? "0" + _loc6_ : "" + _loc6_;
         return _loc9_ + ":" + _loc8_ + ":" + _loc7_;
      }
   }
}
