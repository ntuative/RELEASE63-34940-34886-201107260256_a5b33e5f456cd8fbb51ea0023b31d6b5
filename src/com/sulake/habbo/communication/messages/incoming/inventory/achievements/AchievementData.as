package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1242:int;
      
      private var var_1943:String;
      
      private var var_2049:int;
      
      private var var_2792:int;
      
      private var var_2794:int;
      
      private var var_2050:int;
      
      private var var_2048:Boolean;
      
      private var _category:String;
      
      private var var_2793:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1242 = param1.readInteger();
         this.var_1943 = param1.readString();
         this.var_2049 = Math.max(1,param1.readInteger());
         this.var_2792 = param1.readInteger();
         this.var_2794 = param1.readInteger();
         this.var_2050 = param1.readInteger();
         this.var_2048 = param1.readBoolean();
         this._category = param1.readString();
         this.var_2793 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_1943;
      }
      
      public function get level() : int
      {
         return this.var_1242;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2049;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2792;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_2794;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2050;
      }
      
      public function get finalLevel() : Boolean
      {
         return this.var_2048;
      }
      
      public function get category() : String
      {
         return this._category;
      }
      
      public function get levelCount() : int
      {
         return this.var_2793;
      }
      
      public function get firstLevelAchieved() : Boolean
      {
         return this.var_1242 > 1 || this.var_2048;
      }
      
      public function setMaxProgress() : void
      {
         this.var_2050 = this.var_2049;
      }
   }
}
