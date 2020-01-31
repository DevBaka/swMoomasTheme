<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function smarty_modifier_sortby($arrData, $sortfields) {
   array_sort_by_fields($arrData, $sortfields);
   return $arrData;
} 