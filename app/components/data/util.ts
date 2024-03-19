import {
  filterDownloads,
  getTotalDownloads,
  groupByMajor,
  groupByMinor,
  type Grouped,
} from 'package-majors/utils';

import type { DownloadsResponse } from 'package-majors/types';

export interface FormattedData {
  name: string;
  downloads: Grouped;
}

export function format(data: DownloadsResponse[], groupBy: 'minors' | 'majors', showOld: boolean, granularity: 'monthly' | 'daily' | 'total' = 'monthly') {
  const grouped = data.map((datum) => {
    let dls = datum.downloads;

    if (!showOld) {
      let total = getTotalDownloads(dls, granularity);
      let onePercent = total * 0.01;

      dls = filterDownloads(dls, granularity, onePercent);
    }

    let downloads = groupBy === 'minors' ? groupByMinor(dls, granularity) : groupByMajor(dls, granularity);

    return {
      name: datum.package,
      downloads,
    };
  });

  return grouped;
}
