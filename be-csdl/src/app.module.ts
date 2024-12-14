import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { EmployeeModule } from './employee/employee.module';
import { IngredientModule } from './ingredient/ingredient.module';
import { OrderModule } from './order/order.module';
import { ProductModule } from './product/product.module';
import { StoreModule } from './store/store.module';
import { SupplierModule } from './supplier/supplier.module';
import { OtherModule } from './other/other.module';
import { AuthModule } from './auth/auth.module';
import { revenueModule } from './revenue/revenue.module';
@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
   EmployeeModule,
   IngredientModule,
   OrderModule,
   ProductModule,
   StoreModule,
   SupplierModule,
   OtherModule,
   AuthModule,
   revenueModule
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
