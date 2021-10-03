package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_999:IAssetLoader;
      
      private var var_2565:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         this.var_2565 = param1;
         this.var_999 = param2;
      }
      
      public function get assetName() : String
      {
         return this.var_2565;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return this.var_999;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_999 != null)
            {
               if(!this.var_999.disposed)
               {
                  this.var_999.dispose();
                  this.var_999 = null;
               }
            }
            super.dispose();
         }
      }
   }
}
