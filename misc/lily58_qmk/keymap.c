#include QMK_KEYBOARD_H


enum layer_number {
  _QWERTY = 0,
  _LOWER,
  _RAISE,
};

#define KC_EXT MO(_LOWER)
#define KC_SYM MO(_RAISE)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {


 [_QWERTY] = LAYOUT(
  KC_ESC,   KC_1,   KC_2,    KC_3,    KC_4,    KC_5,                              KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_DEL,
  KC_TAB,   KC_Q,   KC_W,    KC_E,    KC_R,    KC_T,                              KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_LBRC,
  KC_RALT,  KC_A,   KC_S,    KC_D,    KC_F,    KC_G,                              KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT,
  KC_LSFT,  KC_Z,   KC_X,    KC_C,    KC_V,    KC_B, LSFT(KC_1),  LSFT(KC_MINS),  KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_PSCR,
                   KC_LALT, KC_EXT,  KC_LCTL, LGUI_T(KC_SPC),    KC_ENT, KC_LSFT, KC_SYM, KC_BSPC
),

 [_LOWER] = LAYOUT(
  _______, KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,                      KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  
  _______, _______, _______, _______, KC_BRID, KC_BRIU,                    KC_PGDN, KC_HOME, KC_UP,   KC_END,  KC_PGUP, KC_F12,
  _______, _______, _______, _______, _______, _______,                     _______, KC_LEFT, KC_DOWN, KC_RGHT, _______, _______,
  _______, _______, _______, _______, _______, _______, KC_VOLD,  KC_VOLU, _______, _______, _______, _______, _______, _______,
                             _______, _______, _______, _______,  KC_PENT, _______, _______, _______
),

[_RAISE] = LAYOUT(
  _______,       RALT(KC_E),    RALT(KC_3),   LSFT(KC_6), LSFT(KC_EQL), _______,                               _______,      LSFT(KC_GRV),  KC_EQL,       RALT(KC_EQL),  KC_RBRC,     _______,
  KC_GRV,        RALT(KC_2),    KC_NUBS,      KC_MINS,    LSFT(KC_7),   RALT(KC_RBRC),                         LSFT(KC_5),   RALT(KC_NUBS), LSFT(KC_0),   LSFT(KC_NUBS), LSFT(KC_3), LSFT(KC_COMM),
  LSFT(KC_NUHS), LSFT(KC_SLSH), RALT(KC_7),   RALT(KC_8), LSFT(KC_8),   LSFT(KC_2),                            KC_BSLS,      LSFT(KC_9),    RALT(KC_9),   RALT(KC_0),    RALT(KC_4), LSFT(KC_DOT),
  KC_LCTL,       _______,       _______,      _______,    _______,      _______,       LSFT(KC_RBRC), KC_RBRC, _______,      _______,       _______,      _______,       _______,    _______,
                                              _______,    _______,      _______,       _______,       _______, _______,      _______,       _______
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
