// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library fasta.scanner.token_constants;

import 'characters.dart';

const int EOF_TOKEN = 0;

const int KEYWORD_TOKEN = $k;
const int IDENTIFIER_TOKEN = $a;
const int SCRIPT_TOKEN = $b;
const int BAD_INPUT_TOKEN = $X;
const int DOUBLE_TOKEN = $d;
const int INT_TOKEN = $i;
const int RECOVERY_TOKEN = $r;
const int HEXADECIMAL_TOKEN = $x;
const int STRING_TOKEN = $SQ;

const int AMPERSAND_TOKEN = $AMPERSAND;
const int BACKPING_TOKEN = $BACKPING;
const int BACKSLASH_TOKEN = $BACKSLASH;
const int BANG_TOKEN = $BANG;
const int BAR_TOKEN = $BAR;
const int COLON_TOKEN = $COLON;
const int COMMA_TOKEN = $COMMA;
const int EQ_TOKEN = $EQ;
const int GT_TOKEN = $GT;
const int HASH_TOKEN = $HASH;
const int OPEN_CURLY_BRACKET_TOKEN = $OPEN_CURLY_BRACKET;
const int OPEN_SQUARE_BRACKET_TOKEN = $OPEN_SQUARE_BRACKET;
const int OPEN_PAREN_TOKEN = $OPEN_PAREN;
const int LT_TOKEN = $LT;
const int MINUS_TOKEN = $MINUS;
const int PERIOD_TOKEN = $PERIOD;
const int PLUS_TOKEN = $PLUS;
const int QUESTION_TOKEN = $QUESTION;
const int AT_TOKEN = $AT;
const int CLOSE_CURLY_BRACKET_TOKEN = $CLOSE_CURLY_BRACKET;
const int CLOSE_SQUARE_BRACKET_TOKEN = $CLOSE_SQUARE_BRACKET;
const int CLOSE_PAREN_TOKEN = $CLOSE_PAREN;
const int SEMICOLON_TOKEN = $SEMICOLON;
const int SLASH_TOKEN = $SLASH;
const int TILDE_TOKEN = $TILDE;
const int STAR_TOKEN = $STAR;
const int PERCENT_TOKEN = $PERCENT;
const int CARET_TOKEN = $CARET;

const int STRING_INTERPOLATION_TOKEN = 128;
const int LT_EQ_TOKEN = STRING_INTERPOLATION_TOKEN + 1;
const int FUNCTION_TOKEN = LT_EQ_TOKEN + 1;
const int SLASH_EQ_TOKEN = FUNCTION_TOKEN + 1;
const int PERIOD_PERIOD_PERIOD_TOKEN = SLASH_EQ_TOKEN + 1;
const int PERIOD_PERIOD_TOKEN = PERIOD_PERIOD_PERIOD_TOKEN + 1;
const int EQ_EQ_EQ_TOKEN = PERIOD_PERIOD_TOKEN + 1;
const int EQ_EQ_TOKEN = EQ_EQ_EQ_TOKEN + 1;
const int LT_LT_EQ_TOKEN = EQ_EQ_TOKEN + 1;
const int LT_LT_TOKEN = LT_LT_EQ_TOKEN + 1;
const int GT_EQ_TOKEN = LT_LT_TOKEN + 1;
const int GT_GT_EQ_TOKEN = GT_EQ_TOKEN + 1;
const int INDEX_EQ_TOKEN = GT_GT_EQ_TOKEN + 1;
const int INDEX_TOKEN = INDEX_EQ_TOKEN + 1;
const int BANG_EQ_EQ_TOKEN = INDEX_TOKEN + 1;
const int BANG_EQ_TOKEN = BANG_EQ_EQ_TOKEN + 1;
const int AMPERSAND_AMPERSAND_TOKEN = BANG_EQ_TOKEN + 1;
const int AMPERSAND_EQ_TOKEN = AMPERSAND_AMPERSAND_TOKEN + 1;
const int BAR_BAR_TOKEN = AMPERSAND_EQ_TOKEN + 1;
const int BAR_EQ_TOKEN = BAR_BAR_TOKEN + 1;
const int STAR_EQ_TOKEN = BAR_EQ_TOKEN + 1;
const int PLUS_PLUS_TOKEN = STAR_EQ_TOKEN + 1;
const int PLUS_EQ_TOKEN = PLUS_PLUS_TOKEN + 1;
const int MINUS_MINUS_TOKEN = PLUS_EQ_TOKEN + 1;
const int MINUS_EQ_TOKEN = MINUS_MINUS_TOKEN + 1;
const int TILDE_SLASH_EQ_TOKEN = MINUS_EQ_TOKEN + 1;
const int TILDE_SLASH_TOKEN = TILDE_SLASH_EQ_TOKEN + 1;
const int PERCENT_EQ_TOKEN = TILDE_SLASH_TOKEN + 1;
const int GT_GT_TOKEN = PERCENT_EQ_TOKEN + 1;
const int CARET_EQ_TOKEN = GT_GT_TOKEN + 1;
const int COMMENT_TOKEN = CARET_EQ_TOKEN + 1;
const int STRING_INTERPOLATION_IDENTIFIER_TOKEN = COMMENT_TOKEN + 1;
const int QUESTION_PERIOD_TOKEN = STRING_INTERPOLATION_IDENTIFIER_TOKEN + 1;
const int QUESTION_QUESTION_TOKEN = QUESTION_PERIOD_TOKEN + 1;
const int QUESTION_QUESTION_EQ_TOKEN = QUESTION_QUESTION_TOKEN + 1;
