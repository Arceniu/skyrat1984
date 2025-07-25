// THIS IS A NOVA SECTOR UI FILE
import { ReactNode, useState } from 'react';
import { Button, ByondUi, Section, Stack } from 'tgui-core/components';

import { resolveAsset } from '../../assets';
import { useBackend } from '../../backend';
import { Window } from '../../layouts';
import { ExaminePanelData } from './data';

function formatURLs(text: string) {
  if (!text) return;
  const parts: ReactNode[] = [];
  let regex = /https?:\/\/[^\s/$.?#].[^\s]*/gi;
  let lastIndex = 0;

  text.replace(regex, (url, index) => {
    parts.push(text.substring(lastIndex, index));
    parts.push(
      <a
        style={{
          color: '#0591e3',
          textDecoration: 'none',
          borderBottom: 'solid 1.25px',
        }}
        href={url}
      >
        {url}
      </a>,
    );
    lastIndex = index + url.length;
    return url;
  });

  parts.push(text.substring(lastIndex));

  return <div>{parts}</div>;
}

export function ExaminePanel(props) {
  const { data } = useBackend<ExaminePanelData>();
  const {
    character_name,
    assigned_map,
    flavor_text,
    ooc_notes,
    custom_species,
    custom_species_lore,
    headshot,
    nova_star_status,
    // SS1984 REMOVAL START
    // ideal_antag_optin_status,
    // current_antag_optin_status,
    // opt_in_colors,
    // SS1984 REMOVAL END
  } = data;
  const [oocNotesIndex, setOocNotesIndex] = useState('SFW');
  const [flavorTextIndex, setFlavorTextIndex] = useState('SFW');
  return (
    <Window title={character_name} width={900} height={670} theme="ntos">
      <Window.Content>
        <Stack fill>
          <Stack.Item width="30%">
            {!headshot ? (
              <Section fill title="Character Preview">
                <ByondUi
                  height="100%"
                  width="100%"
                  className="ExaminePanel__map"
                  params={{
                    id: assigned_map,
                    type: 'map',
                  }}
                />
              </Section>
            ) : (
              <>
                <Section height="310px" title="Character Preview">
                  <ByondUi
                    height="260px"
                    width="100%"
                    className="ExaminePanel__map"
                    params={{
                      id: assigned_map,
                      type: 'map',
                    }}
                  />
                </Section>
                <Section height="310px" title="Headshot">
                  <img
                    src={resolveAsset(headshot)}
                    height="250px"
                    width="250px"
                  />
                </Section>
              </>
            )}
          </Stack.Item>
          <Stack.Item grow>
            <Stack fill vertical>
              <Stack.Item grow>
                <Section
                  scrollable
                  fill
                  preserveWhitespace
                  title="Flavor Text"
                  buttons={
                    <Button
                      selected={flavorTextIndex === 'SFW'}
                      bold={flavorTextIndex === 'SFW'}
                      onClick={() => setFlavorTextIndex('SFW')}
                      textAlign="center"
                      width="150px"
                    >
                      SFW
                    </Button>
                  }
                >
                  {flavorTextIndex === 'SFW' && formatURLs(flavor_text)}
                </Section>
              </Stack.Item>
              <Stack.Item grow>
                <Stack fill>
                  <Stack.Item grow basis={0}>
                    <Section
                      scrollable
                      fill
                      title="OOC Notes"
                      preserveWhitespace
                      buttons={
                        // SS1984 REMOVAL <>
                          <Button
                            selected={oocNotesIndex === 'SFW'}
                            bold={oocNotesIndex === 'SFW'}
                            onClick={() => setOocNotesIndex('SFW')}
                            textAlign="center"
                            minWidth="60px"
                          >
                            SFW
                          </Button>
                          // SS1984 REMOVAL START
                          // <Button
                          //   selected={oocNotesIndex === 'NSFW'}
                          //   disabled={!ooc_notes_nsfw}
                          //   bold={oocNotesIndex === 'NSFW'}
                          //   onClick={() => setOocNotesIndex('NSFW')}
                          //   textAlign="center"
                          //   minWidth="60px"
                          // >
                          //   NSFW
                          // </Button>
                          // </>
                          // SS1984 REMOVAL END
                      }
                    >
                      {!!nova_star_status && (
                        <Stack.Item mb="8px">
                          <span
                            style={{
                              color: 'gold',
                              fontWeight: 'bold',
                            }}
                          >
                            Player is a Veteran. { /* SS1984 EDIT, original: Nova Star! ⭐ */ }
                          </span>
                        </Stack.Item>
                      )}
                      {/* SS1984 EDIT START */}
                      {(<Stack.Item>
                      {/*
                      {oocNotesIndex === 'SFW' && (
                        <Stack.Item>
                          {ideal_antag_optin_status && (
                            <Stack.Item>
                              Current Antag Opt-In Status:{' '}
                              <span
                                style={{
                                  fontWeight: 'bold',
                                  color:
                                    opt_in_colors[current_antag_optin_status],
                                }}
                              >
                                {current_antag_optin_status}
                              </span>
                              {'\n'}
                              Antag Opt-In Status {'(Preferences)'}:{' '}
                              <span
                                style={{
                                  color:
                                    opt_in_colors[ideal_antag_optin_status],
                                }}
                              >
                                {ideal_antag_optin_status}
                              </span>
                              {'\n\n'}
                            </Stack.Item>
                          )}
                        */}
                        {/* SS1984 EDIT END */}
                          {formatURLs(ooc_notes)}
                        </Stack.Item>
                      )}
                    </Section>
                  </Stack.Item>
                  <Stack.Item grow basis={0}>
                    <Section
                      scrollable
                      fill
                      preserveWhitespace
                      title={
                        custom_species
                          ? 'Species: ' + custom_species
                          : 'No Custom Species!'
                      }
                    >
                      {custom_species
                        ? formatURLs(custom_species_lore)
                        : 'Just a normal space dweller.'}
                    </Section>
                  </Stack.Item>
                </Stack>
              </Stack.Item>
            </Stack>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
}
