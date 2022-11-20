<?php

namespace EnumHelper;

trait EnumIsValidValueTrait
{
    public static function isValidValue($value): bool
    {
        $isValid = false;

        try {
            foreach (self::cases() as $enum) {
                if (gettype($enum->value) == 'integer' && $enum->value === (int) $value) {
                    $isValid = true;
                }
                if (gettype($enum->value) == 'string' && $enum->value === strval($value)) {
                    $isValid = true;
                }
            }
        } catch (\Exception $e) {
            $isValid = false;
        }

        return $isValid;
    }
}