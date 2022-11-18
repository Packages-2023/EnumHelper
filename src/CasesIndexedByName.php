<?php

namespace EnumHelper;

trait CasesIndexedByName
{
    /**
     * @return array<string, self>
     */
    public static function casesIndexedByName()
    {
        return array_combine(
            array_map(
                fn(self $that) => $that->name,
                self::cases()
            ),
            self::cases()
        );
    }
}
