import { onDocumentCreated } from 'firebase-functions/v2/firestore';
import { initializeApp } from 'firebase-admin/app';
import { getFirestore } from 'firebase-admin/firestore';
import { getMessaging } from 'firebase-admin/messaging';

initializeApp();

export const notifyPartnerOnPing = onDocumentCreated(
  {
    document: 'pairs/{pairId}/pings/{pingId}',
    database: 'ai-studio-1d95f597-0474-4855-9067-670eef996a07',
  },
  async (event) => {
    const ping = event.data?.data();
    if (!ping) return;

    const db = getFirestore('ai-studio-1d95f597-0474-4855-9067-670eef996a07');
    const recipientUid = (ping.memberUids || []).find((uid) => uid !== ping.senderUid);
    if (!recipientUid) return;

    const deviceSnap = await db
      .collection('pairs')
      .doc(ping.pairId)
      .collection('devices')
      .doc(recipientUid)
      .get();

    const fcmToken = deviceSnap.data()?.fcmToken;
    if (!fcmToken) return;

    await getMessaging().send({
      token: fcmToken,
      notification: {
        title: 'Notifye',
        body: 'Your partner wants your attention',
      },
      data: {
        pairId: ping.pairId,
        pingId: ping.pingId,
      },
    });
  }
);
