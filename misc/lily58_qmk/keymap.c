#include QMK_KEYBOARD_H


enum layer_number {
  _QWERTY = 0,
  _LOWER,
  _ADJUST,
  _NUM,
};


#define KC_EXT MO(_LOWER)
#define KC_ADJ MO(_ADJUST)
#define KC_NUM MO(_NUM)
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
  KC_ESC,   KC_1,   KC_2,    KC_3,            KC_4,    KC_5,                       KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_DEL,
  KC_TAB,   KC_Q,   KC_W,    KC_E,            KC_R,    KC_T,                       KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_LBRC,
  KC_LSFT,  KC_A,   KC_S,    KC_D,            KC_F,    KC_G,                       KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT,
  KC_LGUI,  KC_Z,   KC_X,    KC_C,            KC_V,    KC_B,    KC_LALT,  KC_BSPC, KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_PSCR,
                             KC_CAPS, KC_ADJ, KC_LCTL, KC_SPC,          LT(_NUM,   KC_ENT), KC_LSFT, KC_EXT,  _______
),

 [_LOWER] = LAYOUT(
  _______, _______,       _______,    _______,       _______,       LSFT(KC_EQL),                        KC_EQL,        _______,       _______,    _______,    _______,    QK_BOOT,
  _______, LSFT(KC_1),    KC_NUBS,    LSFT(KC_NUBS), LSFT(KC_2),    RALT(KC_EQL),                        LSFT(KC_6),    LSFT(KC_5),    RALT(KC_8), RALT(KC_9), RALT(KC_3), KC_RBRC,
  _______, LSFT(KC_SLSH), KC_SLSH,    KC_MINS,       LSFT(KC_0),    LSFT(KC_3),                          KC_BSLS,       LSFT(KC_DOT),  LSFT(KC_8), LSFT(KC_9), RALT(KC_4), LSFT(KC_GRV),
  _______, RALT(KC_RBRC), LSFT(KC_7), LSFT(KC_NUHS), RALT(KC_NUBS), RALT(KC_E),   LSFT(KC_EQL), KC_EQL,  LSFT(KC_RBRC), LSFT(KC_MINS), RALT(KC_7), RALT(KC_0), RALT(KC_2), _______,
                                      _______,       _______,       _______,      _______,      KC_PENT, _______,       _______,       _______
),

[_ADJUST] = LAYOUT(
  QK_BOOT, KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,                     KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,
  TAB_R,   _______, KC_1,    KC_2,    KC_3,    KC_VOLU,                   KC_PGUP, KC_HOME, KC_UP,   KC_END,  _______, KC_F12,
  TAB_L,   _______, KC_4,    KC_5,    KC_6,    KC_VOLD,                   KC_PGDN, KC_LEFT, KC_DOWN, KC_RGHT, _______, _______,
  KC_LGUI, _______, KC_7,    KC_8,    KC_9,    KC_0   , _______, _______, _______, _______, _______, _______, _______, KC_LCTL,
                             _______, _______, _______, _______, KC_PENT, _______, _______, EE_CLR
),

[_NUM] = LAYOUT(
  _______, _______, _______, _______, _______, _______,                   _______, _______, _______, _______, _______, _______,
  _______, _______, _______, _______, _______, _______,                   _______, _______, _______, _______, _______, _______,
  _______, KC_1,    KC_2,    KC_3,    KC_4,    KC_5,                      KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    _______,
  _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
                             _______, _______, _______, _______, KC_PENT, _______, _______, _______
),
};

//SSD1306 OLED update loop, make sure to enable OLED_ENABLE=yes in rules.mk
#ifdef OLED_ENABLE

oled_rotation_t oled_init_user(oled_rotation_t rotation) {
  if (!is_keyboard_master())
    return OLED_ROTATION_180;  // flips the display 180 degrees if offhand
  return rotation;
}

// When you add source files to SRC in rules.mk, you can use functions.
const char *read_layer_state(void);
const char *read_logo(void);
void set_keylog(uint16_t keycode, keyrecord_t *record);
//const char *read_keylog(void);
const char *read_keylogs(void);

// const char *read_mode_icon(bool swap);
// const char *read_host_led_state(void);
// void set_timelog(void);
// const char *read_timelog(void);

bool oled_task_user(void) {
  if (is_keyboard_master()) {
    // If you want to change the display of OLED, you need to change here
    oled_write_ln(read_layer_state(), false);
    //oled_write_ln(read_keylog(), false);
    oled_write_ln(read_keylogs(), false);
    //oled_write_ln(read_mode_icon(keymap_config.swap_lalt_lgui), false);
    //oled_write_ln(read_host_led_state(), false);
    //oled_write_ln(read_timelog(), false);
  } else {
    oled_write(read_logo(), false);
  }
    return false;
}
#endif // OLED_ENABLE

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  if (record->event.pressed) {
#ifdef OLED_ENABLE
    set_keylog(keycode, record);
#endif
    // set_timelog();
  }
  return true;
}
