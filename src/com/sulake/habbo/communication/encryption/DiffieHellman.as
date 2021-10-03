package com.sulake.habbo.communication.encryption
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.communication.handshake.IKeyExchange;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1013:BigInteger;
      
      private var var_2567:BigInteger;
      
      private var var_1909:BigInteger;
      
      private var var_2566:BigInteger;
      
      private var var_1524:BigInteger;
      
      private var var_1908:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1524 = param1;
         this.var_1908 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1524.toString() + ",generator: " + this.var_1908.toString() + ",secret: " + param1);
         this.var_1013 = new BigInteger();
         this.var_1013.fromRadix(param1,param2);
         this.var_2567 = this.var_1908.modPow(this.var_1013,this.var_1524);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1909 = new BigInteger();
         this.var_1909.fromRadix(param1,param2);
         this.var_2566 = this.var_1909.modPow(this.var_1013,this.var_1524);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2567.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2566.toRadix(param1);
      }
   }
}
