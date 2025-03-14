################################################################################
#
# motors
#
################################################################################

MOTORS_SITE = $(call github,openipc,motors,$(MOTORS_VERSION))
MOTORS_VERSION = HEAD

MOTORS_LICENSE = MIT
MOTORS_LICENSE_FILES = LICENSE

define MOTORS_BUILD_CMDS
	$(if $(BR2_PACKAGE_CAMHI_MOTOR), (cd $(@D)/camhi-motor; $(TARGET_CC) -Os -s main.c -o camhi-motor))
	$(if $(BR2_PACKAGE_I2C_MOTOR), (cd $(@D)/i2c-motor; $(TARGET_CC) -Os -s main.c -o i2c-motor))
	$(if $(BR2_PACKAGE_XM_KMOTOR), (cd $(@D)/xm-kmotor; $(TARGET_CC) -Os -s main.c -o xm-kmotor))
	$(if $(BR2_PACKAGE_XM_UART_MOTOR), (cd $(@D)/xm-uart; $(TARGET_CC) -Os -s main.c -o xm-uart))
	$(if $(BR2_PACKAGE_INGENIC_MOTOR), (cd $(@D)/ingenic-motor; $(TARGET_CC) -Os -s main.c -o ingenic-motor))
endef

define MOTORS_INSTALL_TARGET_CMDS
	$(if $(BR2_PACKAGE_CAMHI_MOTOR), $(INSTALL) -m 0755 -D $(@D)/camhi-motor/camhi-motor $(TARGET_DIR)/usr/bin/camhi-motor)
	$(if $(BR2_PACKAGE_I2C_MOTOR), $(INSTALL) -m 0755 -D $(@D)/i2c-motor/i2c-motor $(TARGET_DIR)/usr/bin/i2c-motor)
	$(if $(BR2_PACKAGE_XM_KMOTOR), $(INSTALL) -m 0755 -D $(@D)/xm-kmotor/xm-kmotor $(TARGET_DIR)/usr/bin/xm-kmotor)
	$(if $(BR2_PACKAGE_XM_UART_MOTOR), $(INSTALL) -m 0755 -D $(@D)/xm-uart/xm-uart $(TARGET_DIR)/usr/bin/xm-uart)
	$(if $(BR2_PACKAGE_INGENIC_MOTOR), $(INSTALL) -m 0755 -D $(@D)/ingenic-motor/ingenic-motor $(TARGET_DIR)/usr/bin/ingenic-motor)
endef

$(eval $(generic-package))
