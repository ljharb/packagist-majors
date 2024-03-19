import './header.css';

import { ThemeToggle } from '@universal-ember/preem';
import { ExternalLink } from 'ember-primitives';

import { Arrow } from './icons/fa/external-link';

export const Header = <template>
  <header>
    <div>
      <ExternalLink class="github" href="https://github.com/ljharb/packagist-majors">
        <img alt="" src="/images/github-logo.png" />
        GitHub (Fork)
        <Arrow />
      </ExternalLink>

      <ExternalLink class="github" href="https://github.com/NullVoxPopuli/package-majors">
        <img alt="" src="/images/github-logo.png" />
        GitHub (Original)
        <Arrow />
      </ExternalLink>
    </div>

    <div>
      <ThemeToggle />
    </div>
  </header>
</template>;
