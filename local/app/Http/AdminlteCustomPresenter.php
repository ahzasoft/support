<?php

namespace App\Http;

use Nwidart\Menus\Presenters\Presenter;

class AdminlteCustomPresenter extends Presenter
{
    /**
     * {@inheritdoc }.
     */
    public function getOpenTagWrapper()
    {
        return PHP_EOL . '  <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">' . PHP_EOL;
    }

    public function getMenuWithDropDownWrapper($item)
    {
        return '<li class="nav-item has-treeview' . $this->getActiveStateOnChild($item,  '  menu-open ') . '" ' . $item->getAttributes() . '>
		          <a href="#" class="nav-link">
					'.$item->getIcon().' 
					  <p>' . $item->title . '<i class="fas fa-angle-left right"></i></p>
                  </a>
			       <ul class="nav nav-treeview">
			      	' . $this->getChildMenuItems($item) . '
			      </ul>
		      	</li>'
            . PHP_EOL;
    }


    public function getMenuWithoutDropdownWrapper($item)
    {
        return '<li ' . $this->getActiveState($item) . '><a href="' . $item->getUrl() . '" ' . $item->getAttributes() . ' class="nav-link" >' . $item->getIcon() . ' <span>' . $item->title . '</span></a></li>' . PHP_EOL;
    }

    /**
     * {@inheritdoc }.
     */
    public function getCloseTagWrapper()
    {
        return PHP_EOL . '</ul>' . PHP_EOL;
    }

    /**
     * {@inheritdoc }.
     */


    /**
     * {@inheritdoc }.
     */
    public function getActiveState($item, $state = ' class="menu-open"')
    {
        return $item->isActive() ? 'class="nav-item2 menu-select"' : 'class="nav-item2" ';
    }

    /**
     * Get active state on child items.
     *
     * @param $item
     * @param string $state
     *
     * @return null|string
     */
    public function getActiveStateOnChild($item, $state = 'menu-open')
    {
        return $item->hasActiveOnChild() ? $state : null;
    }

    /**
     * {@inheritdoc }.
     */
    public function getDividerWrapper()
    {
        return '<li class="divider"></li>';
    }

    /**
     * {@inheritdoc }.
     */
    public function getHeaderWrapper($item)
    {
        return '<li class="header">' . $item->title . '</li>';
    }

    /**
     * {@inheritdoc }.
     */


    /**
     * Get multilevel menu wrapper.
     *
     * @param \Nwidart\Menus\MenuItem $item
     *
     * @return string`
     */
    public function getMultiLevelDropdownWrapper($item)
    {
        return '<li class="treeview' . $this->getActiveStateOnChild($item, ' active') . '">
		          <a href="#">
					' . $item->getIcon() . ' <span>' . $item->title . '</span>
			      	<span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
			      </a>
			      <ul class="treeview-menu">
			      	' . $this->getChildMenuItems($item) . '
			      </ul>
		      	</li>'
        . PHP_EOL;
    }
}
