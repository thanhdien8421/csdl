import { IsDate, IsString } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateOrderDto {
  @IsDate()
  @Type(() => Date)
  orderDate?: Date;

  @IsDate()
  @IsString()
  paymentMethod: string;
}
