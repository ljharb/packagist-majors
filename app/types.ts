export interface DownloadsResponse {
  package: string;
  downloads: {
    [version: string]: {
      monthly: number;
      daily: number;
      total: number;
    };
  };
}

export interface ErrorResponse {
  error: string;
  statusCode: number;
}

export type DownloadsByMajor = [major: number, downloads: number][];
