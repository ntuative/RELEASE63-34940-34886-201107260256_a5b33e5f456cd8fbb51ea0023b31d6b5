package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_1035:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2507:int;
      
      private var var_2506:int;
      
      private var _color:uint;
      
      private var var_1374:int;
      
      private var var_2505:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_1035);
         this.var_2507 = param1;
         this.var_2506 = param2;
         this._color = param3;
         this.var_1374 = param4;
         this.var_2505 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2507;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2506;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1374;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2505;
      }
   }
}
