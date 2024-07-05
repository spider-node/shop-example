
-- 对用户的积分进行管控
CREATE TABLE `integral`
(
   `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
   `integral_code` varchar(64) NOT NULL DEFAULT '' COMMENT '积分编号',
   `integral_num` decimal(20,5) DEFAULT '0.00000' COMMENT '积分数量',
   `user` varchar(64) NOT NULL DEFAULT '' COMMENT '积分持有人',
   `lock_status` varchar(10)  NOT NULL DEFAULT 'UNLOCK' COMMENT '是否锁住',
   `lock_code`  varchar(64)  NOT NULL DEFAULT '' COMMENT '锁标识',
   `lock_number`  decimal(20,5) DEFAULT '0.00000' COMMENT '锁定数量',
   `remarks` varchar(128) NOT NULL DEFAULT '' COMMENT '备注',
   `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
   `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
   PRIMARY KEY (`id`),
   KEY `create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=9674 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='积分表';

-- 库存管理 商品的库存，作用于在商品下单时候，进行库存锁定，扣减库存
CREATE TABLE `stock` (
   `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
   `good_code` varchar(64) NOT NULL DEFAULT '' COMMENT '商品编号',
   `good_name` varchar(64) NOT NULL DEFAULT '' COMMENT '商品名称',
   `good_number` decimal(20,5) DEFAULT '0.00000' COMMENT '商品数量',
   `lock_status` varchar(10)  NOT NULL DEFAULT 'UNLOCK' COMMENT '是否锁住',
   `lock_code`  varchar(64)  NOT NULL DEFAULT '' COMMENT '锁标识',
   `lock_number`  decimal(20,5) DEFAULT '0.00000' COMMENT '锁定数量',
   `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
   `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
   PRIMARY KEY (`id`),
   KEY `good_code` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=9674 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='库存表';

-- 商品订单表 作用于用户选择商品进行购买过程中，进行下单
CREATE TABLE `goods_order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_no` varchar(64) NOT NULL DEFAULT '' COMMENT '订单编号',
  `good_number` decimal(20,5) DEFAULT '0.00000' COMMENT '订单金额',
  `good_code` varchar(64) NOT NULL DEFAULT '' COMMENT '商品编号',
  `order_money`  decimal(20,5) DEFAULT '0.00000' COMMENT '订单金额',
  `deduction_amount`  decimal(20,5) DEFAULT '0.00000' COMMENT '抵扣金额',
  `actual_payment`  decimal(20,5) DEFAULT '0.00000' COMMENT '实际支付金额',
  `order_status` varchar(64) NOT NULL DEFAULT 'DRAFT' COMMENT '订单状态/DRAFT/WAIT_PAID/PAID/CANCEL/FAIL',
  `remarks` varchar(128) NOT NULL DEFAULT '' COMMENT '备注',
  `create_user` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=9674 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='订单表';
-- 支付订单表 管控支付中的生命周期，
CREATE TABLE `pay_center` (
   `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
   `pay_order` varchar(64) NOT NULL DEFAULT '' COMMENT '支付订单号',
   `other_no` varchar(100)  NOT NULL DEFAULT '' COMMENT '第三方订单号',
   `good_code` varchar(64) NOT NULL DEFAULT '' COMMENT '商品编号',
   `pay_money`  decimal(20,5) DEFAULT '0.00000' COMMENT '支付金额',
   `pay_type`  varchar(64) NOT NULL DEFAULT 'WX/ZFB' COMMENT '支付方式',
   `pay_user`  varchar(64) NOT NULL DEFAULT '' COMMENT '支付人',
   `order_status` varchar(64) NOT NULL DEFAULT 'WAIT_PAID' COMMENT '订单状态/DRAFT/WAIT_PAID/PAID/FAIL/CANCEL',
   `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
   `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
   PRIMARY KEY (`id`),
   KEY `good_code` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=9674 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='支付表';




