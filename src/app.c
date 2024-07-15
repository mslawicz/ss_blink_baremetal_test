/***************************************************************************//**
 * @file
 * @brief Top level application functions
 *******************************************************************************
 * # License
 * <b>Copyright 2020 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * The licensor of this software is Silicon Laboratories Inc. Your use of this
 * software is governed by the terms of Silicon Labs Master Software License
 * Agreement (MSLA) available at
 * www.silabs.com/about-us/legal/master-software-license-agreement. This
 * software is distributed to you in Source Code format and is governed by the
 * sections of the MSLA applicable to Source Code.
 *
 ******************************************************************************/
#include "blink.h"

#include "em_gpio.h"
#include "sl_simple_led_instances.h"
#include "pin_config.h"

/***************************************************************************//**
 * Initialize application.
 ******************************************************************************/
void app_init(void)
{
  blink_init();

  GPIO_PinModeSet(test_out_1_PORT, test_out_1_PIN, gpioModePushPull, 0);
}

/***************************************************************************//**
 * App ticking function.
 ******************************************************************************/
void app_process_action(void)
{
  blink_process_action();

  if(sl_led_get_state(&sl_led_led0) == SL_LED_CURRENT_STATE_ON)
    {
      /* a short pulse on every LED on event */
      GPIO_PinOutSet(test_out_1_PORT, test_out_1_PIN);
      GPIO_PinOutClear(test_out_1_PORT, test_out_1_PIN);
    }
}
