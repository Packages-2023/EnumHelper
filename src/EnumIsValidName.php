<?php

namespace EnumHelper;

// https://github.com/GitzJoey/DCSLab/blob/v0.6.1/api/app/Traits/EnumHelper.php


trait EnumIsValidNameTrait
{
    public static function isValidName(string $name): bool
    {
        $isValid = false;
        foreach (self::cases() as $enum) {
            if ($enum->name === $name) {
                $isValid = true;
            }
        }

        return $isValid;
    }
}