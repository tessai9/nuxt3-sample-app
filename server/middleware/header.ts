import type { IncomingMessage, ServerResponse } from 'http';

export default async (req: IncomingMessage, res: ServerResponse) => {
  console.log(req.headers);
}
