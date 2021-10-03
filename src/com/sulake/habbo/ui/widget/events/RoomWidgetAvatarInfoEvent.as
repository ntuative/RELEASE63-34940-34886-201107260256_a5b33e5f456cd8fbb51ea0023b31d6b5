package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetAvatarInfoEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_124:String = "RWAIE_AVATAR_INFO";
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2265:Boolean;
      
      private var var_2687:int;
      
      public function RoomWidgetAvatarInfoEvent(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_124,param5,param6);
         this._userId = param1;
         this._userName = param2;
         this.var_2687 = param3;
         this.var_2265 = param4;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get roomIndex() : int
      {
         return this.var_2687;
      }
      
      public function get allowNameChange() : Boolean
      {
         return this.var_2265;
      }
   }
}
