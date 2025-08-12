import AdminLayout from '../../../Layouts/AdminLayout';

export default function Index({ kpis }: { kpis: { activeListings: number; users: number; messages: number } }) {
  return (
    <AdminLayout>
      <h1 className="text-2xl font-bold mb-4">Admin Dashboard</h1>
      <div className="grid gap-4 md:grid-cols-3">
        <div className="p-4 border rounded">Listings: {kpis.activeListings}</div>
        <div className="p-4 border rounded">Users: {kpis.users}</div>
        <div className="p-4 border rounded">Messages: {kpis.messages}</div>
      </div>
    </AdminLayout>
  );
}
