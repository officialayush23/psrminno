import SideNav from "./SideNav";
import TopBar from "./TopBar";

export default function AppLayout({ title, children, unreadCount = 0 }) {
  return (
    <div className="bg-surface font-body text-on-surface min-h-screen">
      <SideNav />
      <main className="ml-[240px] min-h-screen">
        <TopBar title={title} unreadCount={unreadCount} />
        <div>{children}</div>
      </main>
    </div>
  );
}
