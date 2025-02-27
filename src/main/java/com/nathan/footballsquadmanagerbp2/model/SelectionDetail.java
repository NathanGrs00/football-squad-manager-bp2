package com.nathan.footballsquadmanagerbp2.model;

public class SelectionDetail {
    private final int selectionId;
    private final int playerId;
    private final int positionId;

    // Selection Detail is a player selected for a position in a selection.
    public SelectionDetail(int selectionId, int playerId, int positionId) {
        this.selectionId = selectionId;
        this.playerId = playerId;
        this.positionId = positionId;
    }

    public int getSelectionId() {
        return selectionId;
    }

    public int getPlayerId() {
        return playerId;
    }

    public int getPositionId() {
        return positionId;
    }
}
