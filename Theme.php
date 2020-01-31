<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * test
 */

namespace Shopware\Themes\swMoomasTheme;

use Shopware\Components\Form;
use Doctrine\Common\Collections\ArrayCollection;
use Shopware\Components\Theme\ConfigSet;

class Theme extends \Shopware\Components\Theme{

    protected $extend = "Responsive";
    protected $name = "Moomas";
    protected $description = "";
    protected $autor = "DevBaka";
    protected $license = "none-GLP";
    protected $inheritanceConfig = false;
    protected $javascript = [
        'src/js/jquery.cart-animation.js',
        'src/js/jquery.slider-demo.js',
        'src/js/jquery.scroll-nav.js',
        'src/js/jquery.helloworld.js'
    ];
    
    
    public function createConfig(Form\Container\TabContainer $container) {
        //parent::createConfig($container);
        
        $tabPanel = $this->createTabPanel("main_tab_panel");
        
        $colorTab = $this->createColorTab();
        $settingsTab = $this->createSettingsTab();
        $tabPanel->addElement($colorTab);
        $tabPanel->addElement($settingsTab);
        
        //__varName__ sollte unter _private/snippets/backend/config.ini ansprechbar sein, sodass dort die jeweilige Sprache ausgegeben wird. Funktioniert jedoch noch nicht.
        $tab = $this->createTab("main_tab", "__main_tab__");
        $tab->addElement($tabPanel);
        $container->addTab($tab);
        
        //neuen Tab im Tabcontainer für die Template settings im backend erstellen
        /*
        $tab = $this->createTab("Tab_1", "Tab 1", []);
        $fieldset = $this->createFieldSet("FieldSet_1", "FieldSet 1", []);
        $textfield = $this->createTextField("Textfield_1", "Textfield 1", "Test", []);
        
        $fieldset->addElement($textfield);
        $tab->addElement($fieldset);
        $container->addTab($tab);
         */
    }

    private function createColorTab() {
        $tab = $this->createTab("color_tab", "Color Tab");
        $fieldset = $this->createFieldSet("basic_color_fieldset", "Basisfarben");

        
        $backgroundColor = $this->createColorPickerField("backgroundColor", "Hintergrundfarbe", "#EDF6F4");
        $primaryColor = $this->createColorPickerField("brand-primary", "Primärfarbe", "#00A392");
        
        $fieldset->addElement($backgroundColor);
        $fieldset->addElement($primaryColor);
        

        $tab->addElement($fieldset);
        
        return $tab;
    }
    
    
        private function createSettingsTab() {
        $tab = $this->createTab("settings_tab", "Settings Tab");
        $fieldset = $this->createFieldSet("settings_fieldset", "Einstellungen");

        $sloganField = $this->createTextField(
                "themeSlogan",
                "Slogan label",
                '',
                ['attributes' => 
                    ['lessCompatible' => false,
                     'anchor' => '100%']]);
        
        $scrollNavField = $this->createCheckboxField('scrollNav', 'Scroll Nav', false);
        
        $fieldset->addElement($sloganField);
        $fieldset->addElement($scrollNavField);
        

        $tab->addElement($fieldset);
        
        return $tab;
    }
    
    public function createConfigSets(ArrayCollection $collection) {
        //parent::createConfigSets($collection);
        $greenSet = $this->createGreenConfigSet();
        $blueSet = $this->createBlueConfigSet();
        $redSet = $this->createRedConfigSet();
        $graySet = $this->createGrayConfigSet();
        $whiteBlackSet = $this->createBlackWhiteConfigSet();
        
         
        $collection->add($greenSet);
        $collection->add($blueSet);
        $collection->add($redSet);
        $collection->add($graySet);
        $collection->add($whiteBlackSet);
        
    }

    private function createGreenConfigSet() {
        $set = new ConfigSet();
        $set->setName("Green Set");
        $set->setDescription("Make it Grün!");
        $set->setValues([
            'backgroundColor' => '#EDFF4D',
            'brand-primary' => '#00F392'
        ]);
        return $set;
    }
    
        private function createBlueConfigSet() {
        $set = new ConfigSet();
        $set->setName("Blue Set");
        $set->setDescription("Make it Blau!");
        $set->setValues([
            'backgroundColor' => '#4433FA',
            'brand-primary' => '#000043'
        ]);
        return $set;
    }
    
    
        private function createRedConfigSet() {
        $set = new ConfigSet();
        $set->setName("Red Set");
        $set->setDescription("Make it Red!");
        $set->setValues([
            'backgroundColor' => '#FF33BA',
            'brand-primary' => '#FF0043'
        ]);
        return $set;
    }
    
            private function createGrayConfigSet() {
        $set = new ConfigSet();
        $set->setName("Red Set");
        $set->setDescription("Make it Red!");
        $set->setValues([
            'backgroundColor' => '#333333',
            'brand-primary' => '#ABABAB'
        ]);
        return $set;
    }
    
    private function createBlackWhiteConfigSet() {
        $set = new ConfigSet();
        $set->setName("Red Set");
        $set->setDescription("Make it Red!");
        $set->setValues([
            'backgroundColor' => '#FFFFFF',
            'brand-primary' => '#000000'
        ]);
        return $set;
    }
    
    


}
