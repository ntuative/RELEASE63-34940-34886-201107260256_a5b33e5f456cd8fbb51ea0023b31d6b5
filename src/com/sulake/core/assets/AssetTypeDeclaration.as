package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2990:String;
      
      private var var_2988:Class;
      
      private var var_2989:Class;
      
      private var var_2174:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2990 = param1;
         this.var_2988 = param2;
         this.var_2989 = param3;
         if(rest == null)
         {
            this.var_2174 = new Array();
         }
         else
         {
            this.var_2174 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2990;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2988;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2989;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_2174;
      }
   }
}
