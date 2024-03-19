import './granularity.css';

import { assert } from '@ember/debug';
import { on } from '@ember/modifier';

import type { TOC } from '@ember/component/template-only';

function isChecked(value: string, currentValue: string) {
  return value === currentValue;
}

function getLabelClass(value: string, currentValue: string) {
  return value === currentValue ? 'checked' : '';
}

function inputHandler(event: Event) {
  let input = event.target;

  assert(`[BUG], Unexpected dom change`, input instanceof HTMLInputElement);

  input.closest('form')?.requestSubmit();
}

export const Granularity: TOC<{
  Element: HTMLInputElement;
  Args: {
    checked: 'monthly' | 'daily' | 'total';
  };
}> = <template>
  <fieldset class="fun-radios">
    <div class={{getLabelClass "monthly" @checked}}>
      <label>
        <input
          {{on "input" inputHandler}}
          type="radio"
          name="granularity"
          value="monthly"
          checked={{isChecked "monthly" @checked}}
        />
        <div>
          <span>Monthly</span>
        </div>
      </label>
    </div>
    <div class={{getLabelClass "daily" @checked}}>
      <label>
        <input
          {{on "input" inputHandler}}
          type="radio"
          name="granularity"
          value="daily"
          checked={{isChecked "daily" @checked}}
        />
        <span>Daily</span>
      </label>
    </div>
    <div class={{getLabelClass "total" @checked}}>
      <label>
        <input
          {{on "input" inputHandler}}
          type="radio"
          name="granularity"
          value="total"
          checked={{isChecked "total" @checked}}
        />
        <span>Total</span>
      </label>
    </div>
  </fieldset>
</template>;
