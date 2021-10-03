package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_2256:int = 0;
      
      public static const const_1996:int = 1;
      
      public static const const_1781:int = 2;
      
      public static const const_2303:int = 3;
      
      public static const const_2164:int = 4;
      
      public static const const_2188:int = 5;
      
      public static const const_2058:int = 10;
      
      public static const const_2196:int = 11;
      
      public static const const_2240:int = 12;
      
      public static const const_2214:int = 13;
      
      public static const const_2183:int = 16;
      
      public static const const_2354:int = 17;
      
      public static const const_2200:int = 18;
      
      public static const const_2223:int = 19;
      
      public static const const_2248:int = 20;
      
      public static const const_2148:int = 22;
      
      public static const const_2299:int = 23;
      
      public static const const_2187:int = 24;
      
      public static const const_2342:int = 25;
      
      public static const const_2244:int = 26;
      
      public static const const_2239:int = 27;
      
      public static const const_2221:int = 28;
      
      public static const const_2146:int = 29;
      
      public static const const_2279:int = 100;
      
      public static const const_2300:int = 101;
      
      public static const const_2178:int = 102;
      
      public static const const_2155:int = 103;
      
      public static const const_2339:int = 104;
      
      public static const const_2169:int = 105;
      
      public static const const_2304:int = 106;
      
      public static const const_2312:int = 107;
      
      public static const const_2139:int = 108;
      
      public static const const_2283:int = 109;
      
      public static const const_2167:int = 110;
      
      public static const const_2274:int = 111;
      
      public static const const_2165:int = 112;
      
      public static const const_2357:int = 113;
      
      public static const const_2143:int = 114;
      
      public static const const_2318:int = 115;
      
      public static const const_2261:int = 116;
      
      public static const const_2160:int = 117;
      
      public static const const_2209:int = 118;
      
      public static const const_2211:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_9 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1996:
            case const_2058:
               return "banned";
            case const_1781:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
