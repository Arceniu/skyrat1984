// THIS IS A SS1984 UI FILE
import { sortBy } from 'es-toolkit';
import { useMemo, useState } from 'react';
import {
  BlockQuote,
  Button,
  Icon,
  ImageButton,
  Modal,
  Section,
  Stack,
  Tabs,
  Tooltip,
  Box,
  Divider,
  Image,
} from 'tgui-core/components';
import { formatMoney } from 'tgui-core/format';

import { useBackend, useSharedState } from '../backend';
import { SearchBar } from './common/SearchBar';
//
import { CargoData } from './Cargo/types';
//
//
import { Window } from '../layouts';
//

export function CargoImport(props) {
  const [category, setCategory] = useState('');
  const [weapon, setArmament] = useState('weapon');
  const { act, data } = useBackend();
  const [searchText, setSearchText] = useSharedState('search_text', '');
  const {
    armaments_list = [],
    budget_points,
    budget_name,
    self_paid,
    cant_buy_restricted,
  } = data;
}
