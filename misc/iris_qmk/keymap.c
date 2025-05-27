#include QMK_KEYBOARD_H
#if __has_include("keymap.h")
#    include "keymap.h"
#endif


enum layer_number {
  _QWERTY = 0,
  _LOWER,
  _ADJUST,
};

#define KC_EXT MO(_LOWER)
#define KC_ADJ MO(_ADJUST)
#define TAB_R  LCTL(KC_TAB)
#define TAB_L  LCTL(LSFT(KC_TAB))


// #define HRM_L LALT_T(KC_L)
// #define HRM_S LALT_T(KC_S)
// #define HRM_D LGUI_T(KC_D)
// #define HRM_K LGUI_T(KC_K)
// #define HRM_F LCTL_T(KC_F)
// #define HRM_J LCTL_T(KC_J)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {


 [_QWERTY] = LAYOUT(
  KC_ESC,  KC_1, KC_2, KC_3, KC_4,   KC_5,                      KC_6,    KC_7,  KC_8,    KC_9,   KC_0,    KC_DEL,
  KC_TAB,  KC_Q, KC_W, KC_E, KC_R,   KC_T,                      KC_Y,    KC_U,  KC_I,    KC_O,   KC_P,    KC_LBRC,
  KC_LSFT, KC_A, KC_S, KC_D, KC_F,   KC_G,                      KC_H,    KC_J,  KC_K,    KC_L,   KC_SCLN, KC_QUOT,
  KC_LGUI, KC_Z, KC_X, KC_C, KC_V,   KC_B,    KC_LALT, KC_BSPC, KC_N,    KC_M,  KC_COMM, KC_DOT, KC_SLSH, KC_PSCR,
                             KC_ADJ, KC_LCTL, KC_SPC,  KC_ENT,  KC_LSFT, KC_EXT
),
 [_LOWER] = LAYOUT(
  _______, _______,       _______,    _______,       _______,       LSFT(KC_EQL),                   KC_EQL,        _______,       _______,    _______,    _______,    QK_BOOT,
  _______, LSFT(KC_1),    KC_NUBS,    LSFT(KC_NUBS), LSFT(KC_2),    RALT(KC_EQL),                   LSFT(KC_6),    LSFT(KC_5),    RALT(KC_8), RALT(KC_9), RALT(KC_3), KC_RBRC,
  _______, LSFT(KC_SLSH), KC_SLSH,    KC_MINS,       LSFT(KC_0),    LSFT(KC_3),                     KC_BSLS,       LSFT(KC_DOT),  LSFT(KC_8), LSFT(KC_9), RALT(KC_4), LSFT(KC_GRV),
  _______, RALT(KC_RBRC), LSFT(KC_7), LSFT(KC_NUHS), RALT(KC_NUBS), RALT(KC_E),   _______, _______, LSFT(KC_RBRC), LSFT(KC_MINS), RALT(KC_7), RALT(KC_0), RALT(KC_2), _______,
                                                     _______,       _______,      _______, KC_PENT, _______,       _______       
),

[_ADJUST] = LAYOUT(
  QK_BOOT, KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,                      KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  
  TAB_R,   UG_TOGG, RM_TOGG, RM_NEXT, KC_MUTE, KC_VOLU,                    KC_PGUP, KC_HOME, KC_UP,   KC_END,  _______, KC_F12,
  TAB_L,   RM_HUEU, RM_SATU, RM_VALU, _______, KC_VOLD,                    KC_PGDN, KC_LEFT, KC_DOWN, KC_RGHT, _______, _______,
  KC_LGUI, RM_HUED, RM_SATD, RM_VALD, _______, _______, _______,  _______, _______, _______, _______, _______, _______, KC_LCTL,
                                      _______, _______, _______,  KC_PENT, _______, EE_CLR
),
};



#ifdef OTHER_KEYMAP_C
#    include OTHER_KEYMAP_C
#endif // OTHER_KEYMAP_C


