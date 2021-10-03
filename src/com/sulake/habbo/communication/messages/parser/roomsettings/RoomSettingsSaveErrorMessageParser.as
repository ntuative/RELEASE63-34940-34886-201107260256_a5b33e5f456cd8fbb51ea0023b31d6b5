package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_2216:int = 1;
      
      public static const const_2156:int = 2;
      
      public static const const_2358:int = 3;
      
      public static const const_2186:int = 4;
      
      public static const const_1818:int = 5;
      
      public static const const_2197:int = 6;
      
      public static const const_1811:int = 7;
      
      public static const const_1966:int = 8;
      
      public static const const_2162:int = 9;
      
      public static const const_1932:int = 10;
      
      public static const const_1921:int = 11;
      
      public static const const_1959:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1810:int;
      
      private var var_641:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1810 = param1.readInteger();
         this.var_641 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1810;
      }
      
      public function get info() : String
      {
         return this.var_641;
      }
   }
}
